import 'package:dartz/dartz.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/repositories/repositories.dart';

abstract class IFetchSerieEpisodes {
  Future<Either<Failure, ResultFetchSerie>> fetch(String serieName);
}

class FetchSerieEpisodes implements IFetchSerieEpisodes {

  HomeRepository repository;

  FetchSerieEpisodes(this.repository);
  
  @override
  Future<Either<Failure, ResultFetchSerie>> fetch(String serieName) async {
    if(serieName == null || serieName == '') {
      return Left(InvalidTextError());
    }
    return repository.fetchEpisodes(serieName);
  }

}