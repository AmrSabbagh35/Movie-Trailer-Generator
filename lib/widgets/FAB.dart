import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_ui/screens/Confirmation.dart';
import 'package:video_ui/translations/local_keys.g.dart';
import 'package:video_ui/widgets/Stream_dialog.dart';
import 'dart:io';

class FABWidget extends StatefulWidget {
  @override
  _FABWidgetState createState() => _FABWidgetState();
}

class _FABWidgetState extends State<FABWidget> {
  File file;
  // Future<void> getVideo() async {
  //   final video = await ImagePicker().getVideo(source: ImageSource.gallery);
  //   if (video == null)
  //     Container();
  //   else
  //     setState(() {
  //       file = File(video.path);
  //       Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => ConfirmationScreen()));
  //     });
  // }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return StreamDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    var lang = Localizations.localeOf(context).languageCode;
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
          elevation: 4,
          isScrollControlled: false,
          backgroundColor: Color.fromRGBO(32, 32, 32, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            LocaleKeys.chooseText.tr(),
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.attach_file,
                          color: Colors.white,
                        )),
                    title: Text(
                      LocaleKeys.uploadtext.tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: lang == 'en' ? 23 : 20),
                    ),
                    onTap: () {
                      // getVideo();
                      file == null
                          ? Navigator.pop(context)
                          : Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ConfirmationScreen()));
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.online_prediction,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      LocaleKeys.streamText.tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: lang == 'en' ? 23 : 20),
                    ),
                    onTap: () {
                      _displayTextInputDialog(context);
                    },
                  ),
                ],
              ),
            );
          }),
      child: Icon(
        Icons.movie_outlined,
      ),
      backgroundColor: Colors.teal[200],
    );
  }
}
