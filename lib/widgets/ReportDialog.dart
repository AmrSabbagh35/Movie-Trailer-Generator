import 'package:flutter/material.dart';
import 'package:video_ui/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ReportDialog extends StatefulWidget {
  @override
  _ReportDialogState createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  TextEditingController _textFieldController = TextEditingController();

  String codeDialog;
  String valueText;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(LocaleKeys.drawer_reportText.tr(),
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Icon(
            Icons.bug_report_outlined,
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      content: TextField(
        onChanged: (value) {
          setState(() {
            valueText = value;
          });
        },
        controller: _textFieldController,
        decoration: InputDecoration(
          hintText: "What's your problem ? ...",
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          color: Colors.black26,
          textColor: Colors.white,
          child: Text('Cancel'),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        FlatButton(
          color: Colors.black38,
          textColor: Colors.white,
          child: Text('Send'),
          onPressed: () {
            setState(() {
              codeDialog = valueText;
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }
}
