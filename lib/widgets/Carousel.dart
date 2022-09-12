import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_ui/assets.dart';

class CustomCarousel extends StatelessWidget {
  final List<String> items = [
    Assets.theater,
    Assets.godfather,
    Assets.potter,
    Assets.joker,
    Assets.lord,
    Assets.seat,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        scrollPhysics: ClampingScrollPhysics(),
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlay: true,
        aspectRatio: 16 / 9,
        height: ScreenUtil.defaultSize.height * 0.3,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 3),
        // height: 200.0
      ),
      items: items.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              height: 10,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(i), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
            );
          },
        );
      }).toList(),
    );
  }
}
