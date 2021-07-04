import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          children: [
            Text(
              'Make Your Own \n Movie Trailer !',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
                // fontFamily: 'Graphique-W01-Regular'
              ),
            ),
            VerticalDivider(
              color: Colors.white,
              thickness: 2,
              endIndent: 10,
              indent: 10,
              width: 20,
            ),
            SizedBox(
              width: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 80,
                width: 50,
                child: Image.asset(
                  'assets/images/image.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
