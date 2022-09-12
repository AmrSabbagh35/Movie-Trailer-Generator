import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_ui/screens/DisplayVideo.dart';
import 'package:video_ui/screens/Homescreen.dart';
import 'package:video_ui/translations/local_keys.g.dart';

class ConfirmationScreen extends StatefulWidget {
  String url;

  ConfirmationScreen({Key key, this.url}) : super(key: key);

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState(url: url);
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  String url;
  _ConfirmationScreenState({this.url});

  bool subpicked = false;
  FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    super.initState();
    var androidinitialize = new AndroidInitializationSettings('ic_launcher');
    var iosInitilize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidinitialize, iOS: iosInitilize);

    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

  Future<void> showNotification(String title, String body) async {
    var androidDetails = new AndroidNotificationDetails(
        'channelId', 'Hi this is notification', 'Borgir',
        importance: Importance.high);
    var iosDetails = new IOSNotificationDetails();
    var generaldetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotification.show(0, title, body, generaldetails);
  }

  @override
  Widget build(BuildContext context) {
    var lang = Localizations.localeOf(context).languageCode;
    File file;

    Future<void> pickFile() async {
      FilePickerResult result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['srt']);

      if (result != null) {
        file = File(result.files.single.path);
        setState(() {
          subpicked = true;
          print('file selected ${file.path}');
        });
      } else {
        print('not selected');
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#121212"),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Homescreen()));
                  }),
              SizedBox(
                height: ScreenUtil.defaultSize.height * 0.01,
              ),
              Wrap(spacing: 10, runSpacing: 10.0, children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    LocaleKeys.confirmation_selected_text.tr(),
                    style: TextStyle(
                      fontFamily: 'Sans',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    LocaleKeys.confirmation_descText.tr(),
                    textAlign: lang == 'ar' ? TextAlign.right : TextAlign.left,
                    style: TextStyle(
                        wordSpacing: 0.6,
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto'),
                    softWrap: true,
                  ),
                ),
                Center(
                  child: Container(
                      width: ScreenUtil.defaultSize.height * 0.3,
                      child: Divider(color: Colors.white)),
                ),
                subpicked
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            runSpacing: 10,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  LocaleKeys.confirmation_betterText.tr(),
                                  style: TextStyle(
                                      fontFamily: 'Sans',
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.check_box_outlined,
                                  color: Colors.green,
                                ),
                                title: Text(
                                  LocaleKeys.confirmation_FastnetText.tr(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w200),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.check_box_outlined,
                                  color: Colors.green,
                                ),
                                title: Text(
                                  LocaleKeys.confirmation_subText.tr(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w200),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.check_box_outlined,
                                  color: Colors.green,
                                ),
                                title: Text(
                                  LocaleKeys.confirmation_ProcessText.tr(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w200),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              LocaleKeys.confirmation_subsuploadtext.tr(),
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Sans',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          FlatButton.icon(
                            height: ScreenUtil.defaultSize.height * 0.09,
                            onPressed: () {
                              pickFile();
                            },
                            icon: Icon(
                              Icons.upload_file,
                              size: 30,
                              color: Colors.white,
                            ),
                            color: Colors.teal[500],
                            highlightColor: Colors.teal,
                            label: Text(
                              LocaleKeys.confirmation_nofiletext.tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      )
              ]),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      height: ScreenUtil.defaultSize.height * 0.06,
                      color: Colors.green,
                      disabledColor: Colors.grey.withOpacity(0.7),
                      onPressed: subpicked == true
                          ? () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DisplayVideoScreen()));
                              showNotification('Trailer was generated !',
                                  'Tap to see your trailer');
                            }
                          : null,
                      child: Text(
                        LocaleKeys.confirmation_startText.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Sans',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
