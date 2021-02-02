import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/result_fetch_serie_model.dart';

abstract class HomeDatasourceAdapter {
  Future<List<ResultFetchSerieModel>> fetchSeries(int pageNumber);
  Future<List<ResultFetchSerieModel>> searchByName(String serieName);
  Future<ResultFetchSerieModel> fetchEpisodeBySerieName(String serieName);
  Future<ResultFetchEpisodeSummary> fetchEpisodeByParams(EpisodeParams params);
}