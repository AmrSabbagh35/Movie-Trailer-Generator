import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Function funcion;

  const CustomButton({Key key, this.title, this.color, this.icon, this.funcion})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: funcion,
          elevation: 2.0,
          fillColor: color,
          child: Icon(
            icon,
            size: 30.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: ''),
        ),
      ],
    );
  }
}
