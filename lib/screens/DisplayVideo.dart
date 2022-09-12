import 'package:better_player/better_player.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:video_ui/screens/Homescreen.dart';
import 'package:video_ui/translations/local_keys.g.dart';
import 'package:video_ui/widgets/CustomButton.dart';

class DisplayVideoScreen extends StatefulWidget {
  String url;

  DisplayVideoScreen({Key key, this.url}) : super(key: key);

  @override
  _DisplayVideoScreenState createState() => _DisplayVideoScreenState(url);
}

class _DisplayVideoScreenState extends State<DisplayVideoScreen> {
  String url;
  _DisplayVideoScreenState(this.url);

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isdownloaded = false;

    // final videoUrl =
    //     'http://192.168.180.160:8000/media/media/Clips/aa9c6c56-68e1-4090-b0fa-bbd7927a0539/65.mp4';

    Future<bool> _requestPermission(Permission permission) async {
      if (await permission.isGranted) {
        return true;
      } else {
        var result = await permission.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      }
      return false;
    }

    _saveVideo() async {
      var appDocDir;
      if (await _requestPermission(Permission.storage)) {
        appDocDir = await getTemporaryDirectory();
      }
      String savePath = appDocDir.path + "/temp.mp4";
      await Dio().download(
          "https://assets.mixkit.co/videos/preview/mixkit-soldier-killed-in-action-5961-large.mp4",
          savePath);
      final result = await ImageGallerySaver.saveFile(savePath);
      print(result);
      setState(() {
        isdownloaded = true;
      });
    }

    return Scaffold(
      backgroundColor: HexColor("#121212"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer.network(
                'https://assets.mixkit.co/videos/preview/mixkit-part-of-planet-earth-rotating-rapidly-in-space-34352-large.mp4',
                betterPlayerConfiguration: BetterPlayerConfiguration(
                    aspectRatio: 16 / 9,
                    autoDetectFullscreenDeviceOrientation: true,
                    deviceOrientationsOnFullScreen: [
                      DeviceOrientation.landscapeRight,
                      DeviceOrientation.landscapeLeft,
                    ],
                    fit: BoxFit.cover,
                    controlsConfiguration: BetterPlayerControlsConfiguration(
                        playerTheme: BetterPlayerTheme.material,
                        enableAudioTracks: true,
                        enableMute: true,
                        enableProgressBarDrag: true,
                        enableSubtitles: true,
                        backgroundColor: Color.fromRGBO(32, 32, 32, 1))),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                // height: ScreenUtil.defaultSize.height * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: HexColor('1e1e1e')),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.displayText_doneText.tr(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: ScreenUtil.defaultSize.height * 0.17,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              title: LocaleKeys.displayText_saveText.tr(),
                              color: Colors.blue[600],
                              funcion: () async {
                                // controller.pause();
                                await _saveVideo();
                                Fluttertoast.showToast(
                                    msg: isdownloaded
                                        ? 'Video Downloaded !'
                                        : 'Error ! ',
                                    toastLength: Toast.LENGTH_SHORT);
                              },
                              icon: Icons.download,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomButton(
                              title: LocaleKeys.displayText_shareText.tr(),
                              color: Colors.amber[700],
                              funcion: () async {
                                await Share.share(
                                    'check out my GENERATED TRAILER ! https://example.com',
                                    subject: 'Trailer Generator App Result');
                                Fluttertoast.showToast(
                                    backgroundColor: Colors.black38,
                                    msg: 'Thanks for sharing !',
                                    toastLength: Toast.LENGTH_LONG);
                              },
                              icon: Icons.share,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomButton(
                              title: LocaleKeys.displayText_deleteText.tr(),
                              color: Colors.red[700],
                              funcion: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            Color.fromRGBO(32, 32, 32, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        title: Text(
                                            LocaleKeys.displayText_deleteDialog
                                                .tr(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                        actions: [
                                          FlatButton(
                                              onPressed: () async {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Homescreen()));
                                                await Fluttertoast.showToast(
                                                    backgroundColor:
                                                        Colors.black,
                                                    fontSize: 20,
                                                    msg: 'Trailer Deleted !',
                                                    toastLength:
                                                        Toast.LENGTH_LONG);
                                              },
                                              child: Text(
                                                  LocaleKeys.dialog_okText.tr(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20))),
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                  LocaleKeys.dialog_Cancel.tr(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ))),
                                        ],
                                      );
                                    });
                              },
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FlatButton.icon(
                        height: ScreenUtil.defaultSize.height * 0.09,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Homescreen()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        icon: Icon(
                          Icons.reset_tv_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                        color: Colors.teal[500],
                        label: Text(
                          LocaleKeys.displayText_AnotherText.tr(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),

                  // child: Text(
                  //   'Your Generated Trailer !',
                  //   style: TextStyle(fontSize: 40, color: Colors.white),
                  // ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
