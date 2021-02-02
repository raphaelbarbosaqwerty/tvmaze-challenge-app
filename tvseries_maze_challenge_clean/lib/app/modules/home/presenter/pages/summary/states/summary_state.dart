import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/models.dart';

abstract class SummaryState {}

class StartState implements SummaryState {
  const StartState();
}

class LoadingState implements SummaryState {
  const LoadingState();
}

class ErrorState implements SummaryState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements SummaryState {
  final ResultFetchEpisodeSummaryModel episode;
  const SuccessState(this.episode);
}