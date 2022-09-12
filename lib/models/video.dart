import 'package:flutter/foundation.dart';

class Video {
  final int id;
  final String url;

  Video({@required this.id, @required this.url});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(id: json['videoId'] as int, url: json['url'] as String);
  }
}
