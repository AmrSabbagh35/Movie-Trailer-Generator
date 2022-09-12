import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_ui/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:video_ui/translations/local_keys.g.dart';
import 'package:video_ui/widgets/Aboutus.dart';
import 'package:video_ui/widgets/ReportDialog.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return ReportDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

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
                  LocaleKeys.drawer_themeText.tr(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
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
              ExpansionTileCard(
                animateTrailing: true,
                elevation: 10,
                trailing: Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.white,
                ),
                expandedColor: Color.fromRGBO(32, 32, 32, 1),
                expandedTextColor: Colors.white,
                baseColor: Color.fromRGBO(32, 32, 32, 1),
                key: cardA,
                leading: Icon(
                  FontAwesomeIcons.language,
                  color: Colors.white,
                ),
                title: Text(
                  LocaleKeys.drawer_langText.tr(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                children: <Widget>[
                  Divider(
                    thickness: 2,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        context.setLocale(Locale('en'));
                      });
                    },
                    child: ListTile(
                      title: Text(
                        'English',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        context.setLocale(Locale('ar'));
                      });
                    },
                    child: ListTile(
                      title: Text('العربية',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Taj')),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AboutUsDialog();
                      });
                },
                // splashColor: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.contact_support,
                    color: Colors.white,
                  ),
                  title: Text(
                    LocaleKeys.drawer_aboutText.tr(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                    LocaleKeys.drawer_reportText.tr(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
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

bool isDark = true;
