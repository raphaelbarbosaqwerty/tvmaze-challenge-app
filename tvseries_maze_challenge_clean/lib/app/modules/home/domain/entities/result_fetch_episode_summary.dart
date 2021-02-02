import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';

class ResultFetchEpisodeSummary {
  final String name;
  final int number;
  final int season;
  final String summary;
  final String airTime;
  final String airDate;
  final ResultFetchSerieImage image;

  ResultFetchEpisodeSummary({this.airTime, this.airDate, this.name, this.number, this.season, this.summary, this.image});
}