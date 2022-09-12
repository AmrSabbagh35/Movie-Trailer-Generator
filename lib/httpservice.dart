import 'dart:convert';
import 'package:http/http.dart';
import 'package:video_ui/models/Movie.dart';

class HttpService {
  final Uri videoUrl =
      Uri.parse("http://www.omdbapi.com/?t=Taken&apikey=6b813ea6");
  Future<List<Movie>> getInfo(int index) async {
    Response res = await get(
      videoUrl,
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(body);
      List<Movie> movies = body
          .map((dynamic trailer) => Movie.fromjson(trailer, index))
          .toList();
      return movies;
    } else {
      throw "Cant get movie";
    }
  }
}
