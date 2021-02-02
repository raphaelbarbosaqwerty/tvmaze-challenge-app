import 'package:dartz/dartz.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/result_fetch_serie.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/repositories/home_repository.dart';

abstract class ISearchSeriesByName {
  Future<Either<Failure, List<ResultFetchSerie>>> search(String serieName);
}

class SearchSeriesByName implements ISearchSeriesByName {
  final HomeRepository repository;

  SearchSeriesByName(this.repository);
  
  Future<Either<Failure, List<ResultFetchSerie>>> search(String serieName) async {
    if(serieName == null || serieName.isEmpty) {
      return Left(InvalidTextError());
    }

    return repository.search(serieName);
  }
}