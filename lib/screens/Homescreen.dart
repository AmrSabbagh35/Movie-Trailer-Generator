import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_ui/data/data.dart';
import 'package:video_ui/widgets/FAB.dart';
import 'package:video_ui/widgets/Carousel.dart';
import 'package:video_ui/widgets/MainDrawer.dart';
import 'package:video_ui/widgets/Title.dart';
import 'package:video_ui/widgets/genres.dart';

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
        floatingActionButton: FAB_Widget(),
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
              Custom_Carousel(),
              SizedBox(
                height: 10,
              ),

              Genres(title: 'Genres', genreimage: previews),
            ],
          ),
        ),
      ),
    );
  }
}
