import 'package:video_ui/data/data.dart';

class Movie {
  final String title;
  final String date;
  final String pg;
  final String duration;
  final String imageUrl;
  final String plot;
  final String imdb;
  final String total;
  final String meta;

  const Movie(
      {this.title,
      this.date,
      this.pg,
      this.imageUrl,
      this.duration,
      this.plot,
      this.imdb,
      this.total,
      this.meta});

  factory Movie.fromjson(Map<String, dynamic> json, int index) {
    return Movie(
      title: json['Title'] as String,
      date: json['Year'] as String,
      imdb: json['imdbRating'] as String,
      meta: json['Metascore'] as String,
      imageUrl: movies[index].imageUrl,
      pg: json['Rated'] as String,
      duration: movies[index].duration,
      plot: movies[index].plot,
      total: json['imdbVotes'] as String,
    );
  }
}
