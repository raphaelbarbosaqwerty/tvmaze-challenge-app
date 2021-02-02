import 'package:dartz/dartz.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/repositories/home_repository.dart';

abstract class IFetchEpisodeByParams {
  Future<Either<Failure, ResultFetchEpisodeSummary>> fetch(EpisodeParams params);
}

class FetchEpisodeByParams implements IFetchEpisodeByParams {

  final HomeRepository repository;

  FetchEpisodeByParams(this.repository);

  @override
  Future<Either<Failure, ResultFetchEpisodeSummary>> fetch(EpisodeParams params) async {
    if(params.serieNumber == null) {
      return Left(InvalidNumberNullError());
    }

    if(params.episodeNumber == null) {
      return Left(InvalidNumberNullError());
    }

    if(params.seasonNumber == null) {
      return Left(InvalidNumberNullError());
    }

    return repository.fetchEpisodeByParams(params);
  }
}