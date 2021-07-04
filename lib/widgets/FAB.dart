import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_ui/screens/Confirmation.dart';

class FAB_Widget extends StatefulWidget {
  @override
  _FAB_WidgetState createState() => _FAB_WidgetState();
}

class _FAB_WidgetState extends State<FAB_Widget> {
  TextEditingController _linkController;

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Enter Your Movie\'s URL',
                  style: TextStyle(color: Colors.white),
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
            content: TextField(
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {});
              },
              controller: _linkController,
              decoration: InputDecoration(
                hintText: "movie link",
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
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Confirmation_Screen()));
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
                // mainAxisSize: MainAxisSize.min,
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
                            'Choose a Process',
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
                      'Upload a Movie',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {},
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
                      'Stream a URL',
                      style: TextStyle(color: Colors.white),
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
