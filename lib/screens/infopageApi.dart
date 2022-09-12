import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:video_ui/data/data.dart';
import 'package:video_ui/httpservice.dart';
import 'package:video_ui/models/Movie.dart';
import 'package:video_ui/translations/local_keys.g.dart';
import 'package:video_ui/widgets/widget.dart';

class InfoPageTest extends StatelessWidget {
  final int index;
  List<Movie> movie = List.of(movies);

  InfoPageTest({Key key, this.index}) : super(key: key);
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    // Widget _showDetails(int index) {

    // }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        child: Icon(
          Icons.play_arrow,
          size: 30,
        ),
        tooltip: 'Play Trailer',
        onPressed: () {},
      ),
      backgroundColor: HexColor("#121212"),
      body: FutureBuilder(
        future: httpService.getInfo(index),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var lang = Localizations.localeOf(context).languageCode;

            Size size = MediaQuery.of(context).size;

            Movie movie = snapshot.data;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.4,
                        child: Stack(children: [
                          Container(
                            height: size.height * 0.4 - 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(50)),
                                image: DecorationImage(
                                    image: AssetImage(
                                      movie.imageUrl,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            bottom: 0,
                            right: lang == 'en' ? 0 : null,
                            left: lang == 'en' ? null : 0,
                            child: RatingBox(
                                imdb: '${movie.imdb}',
                                meta: '${movie.meta}',
                                total: '${movie.total}'),
                          ),
                          Positioned(
                            left: lang == 'en' ? 20 : null,
                            right: lang == 'en' ? null : 20,
                            top: 30,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CustomBackButton(),
                            ),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    ('${movie.title}'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40),
                                  ),
                                  SizedBox(height: 20 / 2),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${movie.date}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          '${movie.pg}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          '${movie.duration}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        LocaleKeys.plottext.tr(),
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: lang == 'en' ? 'Roboto' : 'Taj',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: ScreenUtil.defaultSize.height * 0.3,
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Card(
                        elevation: 10,
                        color: HexColor('#1e1e1e'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 29,
                                ),
                                child: Text(
                                  '${movie.plot}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.withOpacity(0.8),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300),
                                  textAlign: lang == 'en'
                                      ? TextAlign.left
                                      : TextAlign.right,
                                )),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
    // _showDetails(index));
  }
}
