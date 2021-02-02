import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/result_fetch_serie_image.dart';

class ResultFetchSerieEpisode {
  final String name;
  final int season;
  final int number;
  final String summary;
  final ResultFetchSerieImage images;

  ResultFetchSerieEpisode({this.name, this.season, this.number, this.summary, this.images});
}