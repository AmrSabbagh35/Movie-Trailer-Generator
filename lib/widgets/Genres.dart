import 'package:flutter/material.dart';
import 'package:video_ui/models/Preview.dart';

class Genres extends StatelessWidget {
  final String title;
  final List<Content> genreimage;

  const Genres({
    Key key,
    @required this.title,
    @required this.genreimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 160.0,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: genreimage.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = genreimage[index];
              return GestureDetector(
                onTap: () => print('content.name'),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          height: 130.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(content.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4.0),
                          ),
                        ),
                        Container(
                          height: 130.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.black87,
                                Colors.black45,
                                Colors.transparent,
                              ],
                              stops: [0, 0.25, 1],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
