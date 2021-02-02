import 'dart:convert';

import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/models.dart';

class ResultFetchEpisodeSummaryModel extends ResultFetchEpisodeSummary {
  final String name;
  final int number;
  final int season;
  final String summary;
  final String airTime;
  final String airDate;
  final ResultFetchSerieImageModel image;

  ResultFetchEpisodeSummaryModel({
    this.name,
    this.number,
    this.season,
    this.summary,
    this.airTime, 
    this.airDate,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'season': season,
      'summary': summary,
      'image': image?.toMap(),
    };
  }

  factory ResultFetchEpisodeSummaryModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );

    return ResultFetchEpisodeSummaryModel(
      name: map['name'],
      number: map['number'],
      season: map['season'],
      airDate: map['airdate'],
      airTime: map['airtime'],
      summary: map['summary'].toString().replaceAll(exp, ''),
      image: ResultFetchSerieImageModel.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultFetchEpisodeSummaryModel.fromJson(String source) => ResultFetchEpisodeSummaryModel.fromMap(json.decode(source));
}
