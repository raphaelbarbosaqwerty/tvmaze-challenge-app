import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';

class ResultFetchSerie {
  final int id;
  final String name;
  final String summary;
  final List<String> genres;
  final ResultFetchSerieImage image;
  final ResultFetchSerieSchedule schedules;
  final List<ResultFetchSerieEpisode> episodes;

  ResultFetchSerie({this.id, this.summary, this.name, this.image, this.genres, this.schedules, this.episodes});
}