import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/result_fetch_serie.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/repositories/repositories.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/datasources/home_datasource_adapter.dart';

class HomeRepositoryAdapter implements HomeRepository {

  final HomeDatasourceAdapter datasource;

  HomeRepositoryAdapter(this.datasource);

  @override
  Future<Either<Failure, List<ResultFetchSerie>>> fetch(int pageNumber) async {
    try {
      final result = await datasource.fetchSeries(pageNumber);
      return Right(result); 
    } on DatasourceResultNull catch(e) {
      return Left(e);
    } catch(e) {
      return Left(DatasourceResultNull());
    }
  }

  @override
  Future<Either<Failure, List<ResultFetchSerie>>> search(String serieName) async {
    try {
      final result = await datasource.searchByName(serieName);
      return Right(result);
    } on DatasourceResultNull catch(e) {
      return Left(e);
    } catch(e) {
      return Left(DatasourceResultNull());
    }
  }

  @override
  Future<Either<Failure, ResultFetchSerie>> fetchEpisodes(String serieName) async {
    try {
      final result = await datasource.fetchEpisodeBySerieName(serieName);
      return Right(result);
    } on DatasourceResultNull catch(e) {
      return Left(e);
    } catch(e) {
      return Left(DatasourceResultNull());
    }
  }

  @override
  Future<Either<Failure, ResultFetchEpisodeSummary>> fetchEpisodeByParams(EpisodeParams params) async {
    try {
      final result = await datasource.fetchEpisodeByParams(params);
      return Right(result);
    } on DatasourceResultNull catch(e) {
      return Left(e);
    } catch(e) {
      return Left(DatasourceResultNull());
    }
  }

  
}