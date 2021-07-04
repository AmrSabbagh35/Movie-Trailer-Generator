import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Confirmation_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#121212"),
        body: Padding(
          padding: const EdgeInsets.all(7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                height: 30,
              ),
              Wrap(spacing: 10, runSpacing: 10.0, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Your Movie was Selected Successfully ! 🎉',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'We have found your desired Movie and now The app will start to analyze the movie and do the Magic✨',
                    style: TextStyle(
                        wordSpacing: 1.6,
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                    softWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'For a better result :',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              ListTile(
                leading: Icon(
                  Icons.check_box_outlined,
                  color: Colors.green,
                ),
                title: Text(
                  'Fast Internet Connection.',
                  style: TextStyle(color: Colors.white),
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
                  'A Clear Movie for the AI to make sure it could recognize facial expressions and emotions',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.check_box_outlined,
                  color: Colors.green,
                ),
                title: Text(
                  'Process will take 15 - 20 minutes ⌛',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        color: Colors.green,
                        onPressed: () {},
                        child: Text(
                          'Start',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ))
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
