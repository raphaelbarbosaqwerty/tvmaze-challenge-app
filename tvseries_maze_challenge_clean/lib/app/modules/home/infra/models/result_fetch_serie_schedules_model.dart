import 'dart:convert';

import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';

class ResultFetchSerieScheduleModel extends ResultFetchSerieSchedule {
  final String time;
  final List<String> days;

  ResultFetchSerieScheduleModel({this.time, this.days});

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'days': days,
    };
  }

  factory ResultFetchSerieScheduleModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResultFetchSerieScheduleModel(
      time: map['time'] ?? 'Not found',
      days: List<String>.from(map['days']) ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultFetchSerieScheduleModel.fromJson(String source) => ResultFetchSerieScheduleModel.fromMap(json.decode(source));
}
