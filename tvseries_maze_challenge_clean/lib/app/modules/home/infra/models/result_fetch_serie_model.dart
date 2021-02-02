import 'dart:convert';

import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/models.dart';

class ResultFetchSerieModel extends ResultFetchSerie {
  final int id;
  final String name;
  final String summary;
  final List<String> genres;
  final ResultFetchSerieImageModel image;
  final ResultFetchSerieScheduleModel schedules;
  final List<ResultFetchSerieEpisodeModel> episodes;

  ResultFetchSerieModel({this.id, this.summary, this.name, this.image, this.genres, this.schedules, this.episodes});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'genres': genres,
      'summary': summary,
    };
  }

  factory ResultFetchSerieModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );
  
    return ResultFetchSerieModel(
      id: map['id'] ?? null,
      name: map['name'] ?? 'Not found',
      summary: map['summary'].toString().replaceAll(exp, '') ?? 'Not found',
      image: ResultFetchSerieImageModel.fromMap(map['image']),
      genres: List<String>.from(map['genres'].map((x) => x)) ?? [],
      schedules: ResultFetchSerieScheduleModel.fromMap(map['schedule']),
      episodes: map.containsKey('_embedded') ? List<ResultFetchSerieEpisodeModel>.from(map['_embedded']['episodes'].map((x) => ResultFetchSerieEpisodeModel.fromMap(x))) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultFetchSerieModel.fromJson(String source) => ResultFetchSerieModel.fromMap(json.decode(source));
}
