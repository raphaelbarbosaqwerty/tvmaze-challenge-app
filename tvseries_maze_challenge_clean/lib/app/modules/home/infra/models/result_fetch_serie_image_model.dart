import 'dart:convert';

import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';

class ResultFetchSerieImageModel extends ResultFetchSerieImage {
  final String medium;
  final String original;

  ResultFetchSerieImageModel({this.medium, this.original});

  Map<String, dynamic> toMap() {
    return {
      'medium': medium,
      'original': original,
    };
  }

  factory ResultFetchSerieImageModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResultFetchSerieImageModel(
      medium: map['medium'] == null ? 'https://bitsofco.de/content/images/2018/12/broken-1.png' : map['medium'],
      original: map['original'] == null ? 'https://bitsofco.de/content/images/2018/12/broken-1.png' : map['original'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultFetchSerieImageModel.fromJson(String source) => ResultFetchSerieImageModel.fromMap(json.decode(source));
}