import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Custom_Carousel extends StatefulWidget {
  @override
  Custom__CarouselState createState() => Custom__CarouselState();
}

class Custom__CarouselState extends State<Custom_Carousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlay: true,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 3),
        // height: 200.0
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: double.infinity,
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Image $i',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
