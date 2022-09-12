import 'package:flutter/material.dart';
import 'package:video_ui/assets.dart';

class RatingBox extends StatelessWidget {
  final String imdb;
  final String meta;
  final String total;

  const RatingBox({Key key, this.imdb, this.meta, this.total})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var lang = Localizations.localeOf(context).languageCode;
    Size size = MediaQuery.of(context).size;
    return Container(
      // it will cover 90% of our total width
      width: size.width * 0.7,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.only(
          bottomLeft: lang == 'en' ? Radius.circular(50) : Radius.circular(0),
          topLeft: lang == 'en' ? Radius.circular(50) : Radius.circular(0),
          bottomRight: lang == 'en' ? Radius.circular(0) : Radius.circular(50),
          topRight: lang == 'en' ? Radius.circular(0) : Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 50,
            color: Color(0xFF12153D).withOpacity(0.8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(Assets.imdb))),
                ),
                SizedBox(height: 20 / 4),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "$imdb/",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                          text: "10\n",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      TextSpan(
                        text: "$total",
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFF51CF66),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    "$meta",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20 / 4),
                Text(
                  "Metascore",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "62 critic reviews",
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
