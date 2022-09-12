import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AboutUsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      title: Card(
        color: HexColor('1e1e1e').withOpacity(0.9),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Junior Project | AIU',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic)),
        ),
      ),
      content: Text(
          'Developed By : \n\n- Adnan Aji \n- Amr Sabbagh \n- Duha Aljubbeh \n- Nour Alhuda Zeiter',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontFamily: 'Roboto')),
      actions: [
        FlatButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back',
                style: TextStyle(
                  color: Colors.white,
                )))
      ],
    );
  }
}
