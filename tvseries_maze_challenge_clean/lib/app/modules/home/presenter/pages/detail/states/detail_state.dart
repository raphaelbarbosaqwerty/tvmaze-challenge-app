import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/result_fetch_serie.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';

abstract class DetailState {}

class StartState implements DetailState {
  const StartState();
}

class LoadingState implements DetailState {
  const LoadingState();
}

class ErrorState implements DetailState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements DetailState {
  final ResultFetchSerie resultFetchSerie;
  SuccessState(this.resultFetchSerie);
}