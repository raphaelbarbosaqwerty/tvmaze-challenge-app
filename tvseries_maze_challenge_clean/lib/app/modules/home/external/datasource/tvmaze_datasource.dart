import 'package:dio/dio.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/result_fetch_episode_summary.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/episode_params.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/datasources/home_datasource_adapter.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/models.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/result_fetch_serie_model.dart';

class RemoteTvMazeDatasource implements HomeDatasourceAdapter {
  final Dio dio;

  RemoteTvMazeDatasource(this.dio);
  
  @override
  Future<List<ResultFetchSerieModel>> fetchSeries(int pageNumber) async {
    final response = await dio.get('/shows?page=$pageNumber');
    if(response.statusCode == 200) {
      var jsonList = response.data as List;
      var list = jsonList.map((e) => ResultFetchSerieModel.fromMap(e)).toList();
      return list;
    } else {
      throw DatasourceResultNull();
    }
  }

  @override
  Future<List<ResultFetchSerieModel>> searchByName(String serieName) async {
    final response = await dio.get('/search/shows?q=$serieName'.replaceAll(' ', '+'));
    if(response.statusCode == 200) {
      var jsonList = response.data as List;
      var list = jsonList.map((e) => ResultFetchSerieModel.fromMap(e['show'])).toList();
      return list;
    } else {
      throw DatasourceResultNull();
    }
  }

  @override
  Future<ResultFetchSerieModel> fetchEpisodeBySerieName(String serieName) async {
    final response = await dio.get('/singlesearch/shows?q=${serieName.replaceAll(" ", "+")}&embed=episodes');
    if(response.statusCode == 200){
      var result = ResultFetchSerieModel.fromMap(response.data);
      return result;
    } else {
      throw DatasourceResultNull();
    }
  }

  @override
  Future<ResultFetchEpisodeSummary> fetchEpisodeByParams(EpisodeParams params) async {
    final response = await dio.get('/shows/${params.serieNumber}/episodebynumber?season=${params.seasonNumber}&number=${params.episodeNumber}');
    if(response.statusCode == 200) {
      var result = ResultFetchEpisodeSummaryModel.fromMap(response.data);
      return result;
    } else {
      throw DatasourceResultNull();
    }
  }
}