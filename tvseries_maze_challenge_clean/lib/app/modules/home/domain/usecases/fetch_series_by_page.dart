import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/result_fetch_serie.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/repositories/repositories.dart';
import 'package:dartz/dartz.dart';

abstract class IFetchSeriesByPage {
  Future<Either<Failure, List<ResultFetchSerie>>> fetch(int pageNumber);
}

class FetchSeriesByPage implements IFetchSeriesByPage {
  final HomeRepository repository;

  FetchSeriesByPage(this.repository);

  Future<Either<Failure, List<ResultFetchSerie>>> fetch(int pageNumber) async {
    if(pageNumber == null) {
      return Left(InvalidNumberNullError());
    }

    return repository.fetch(pageNumber);
  }
}
