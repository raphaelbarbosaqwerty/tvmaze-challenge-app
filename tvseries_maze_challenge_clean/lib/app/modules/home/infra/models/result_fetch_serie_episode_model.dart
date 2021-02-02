import 'dart:convert';

import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/models.dart';

class ResultFetchSerieEpisodeModel extends ResultFetchSerieEpisode {
  final String name;
  final int season;
  final int number;
  final String summary;
  final ResultFetchSerieImageModel images;

  ResultFetchSerieEpisodeModel({this.name, this.season, this.number, this.summary, this.images});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'season': season,
      'number': number,
      'summary': summary,
      'images': images?.toMap(),
    };
  }

  factory ResultFetchSerieEpisodeModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResultFetchSerieEpisodeModel(
      name: map['name'] ?? 'Not found',
      season: map['season'] ?? 0,
      number: map['number'] ?? 0,
      summary: map['summary'] ?? 'Not found',
      images: ResultFetchSerieImageModel.fromMap(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultFetchSerieEpisodeModel.fromJson(String source) => ResultFetchSerieEpisodeModel.fromMap(json.decode(source));
}
