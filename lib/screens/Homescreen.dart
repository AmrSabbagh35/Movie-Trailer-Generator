import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_ui/data/data.dart';
import 'package:video_ui/translations/local_keys.g.dart';
import 'package:video_ui/widgets/widget.dart';
import 'package:easy_localization/easy_localization.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        drawer: MainDrawer(),
        drawerEnableOpenDragGesture: false,
        floatingActionButton: FABWidget(),
        backgroundColor: HexColor("#121212"),
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Colors.black38,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () =>
                  _drawerKey.currentState.openDrawer(), // open drawer
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 20,
              // ),
              TitleWidget(),
              SizedBox(
                height: 5,
              ),
              CustomCarousel(),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: ScreenUtil.defaultSize.width * 0.9,
                  child: Divider(
                    // thickness: 1,
                    color: Colors.white,
                  ),
                ),
              ),

              Examples(
                title: LocaleKeys.suggestedtext.tr(),
                exampleimage: previews,
                examplemovie: movies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
