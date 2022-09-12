import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:video_ui/screens/Confirmation.dart';
import 'package:video_ui/translations/local_keys.g.dart';

class StreamDialog extends StatefulWidget {
  @override
  _StreamDialogState createState() => _StreamDialogState();
}

class _StreamDialogState extends State<StreamDialog> {
  TextEditingController linkcontroller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            LocaleKeys.dialog_enterText.tr(),
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          Icon(
            Icons.link,
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      content: Form(
        key: _formKey,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.dialog_validationText.tr();
            }
            return null;
          },
          style: TextStyle(color: Colors.white, fontSize: 20),
          controller: linkcontroller,
          decoration: InputDecoration(
            hintText: LocaleKeys.dialog_hintText.tr(),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          color: Colors.black26,
          textColor: Colors.white,
          child: Text(
            LocaleKeys.dialog_Cancel.tr(),
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        FlatButton(
          color: Colors.black38,
          textColor: Colors.white,
          child: Text(
            LocaleKeys.dialog_okText.tr(),
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      ConfirmationScreen(url: linkcontroller.text)));
            }
          },
        ),
      ],
    );
  }
}
