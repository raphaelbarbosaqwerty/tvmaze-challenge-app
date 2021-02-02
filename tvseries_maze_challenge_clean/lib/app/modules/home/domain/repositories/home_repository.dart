import 'package:dartz/dartz.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<ResultFetchSerie>>> fetch(int pageNumber);
  Future<Either<Failure, List<ResultFetchSerie>>> search(String serieName);
  Future<Either<Failure, ResultFetchSerie>> fetchEpisodes(String serieName);
  Future<Either<Failure, ResultFetchEpisodeSummary>> fetchEpisodeByParams(EpisodeParams params);
}