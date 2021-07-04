import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_ui/assets.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  TextEditingController _textFieldController = TextEditingController();

  String codeDialog;
  String valueText;
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Report A Problem',
                  style: TextStyle(color: Colors.white),
                ),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = true;
    return Drawer(
      child: Container(
        color: Color.fromRGBO(32, 32, 32, 1),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                        top: 15,
                        left: 70,
                        right: 10,
                        bottom: 0,
                        child: Text(
                          'Enjoy Our Service !',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(Assets.cinema),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // width: 40,
                // color: Colors.red,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.moon,
                  color: Colors.white,
                ),
                title: Text(
                  'Theme',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Switch(
                    activeColor: Colors.amber,
                    value: isDark,
                    onChanged: (toggle) {
                      setState(() {
                        isDark = toggle;
                      });
                    }),
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.language,
                  color: Colors.white,
                ),
                title: Text(
                  'Language',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Switch(
                    activeColor: Colors.amber,
                    value: false,
                    onChanged: (isDark) {}),
              ),
              InkWell(
                onTap: () {
                  print('object');
                },
                // splashColor: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.contact_support,
                    color: Colors.white,
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _displayTextInputDialog(context);
                },
                // splashColor: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.report,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Report a Problem',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
