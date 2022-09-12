import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: Center(
        child: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
