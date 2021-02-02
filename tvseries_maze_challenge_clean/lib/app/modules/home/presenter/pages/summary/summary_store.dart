import 'package:rx_notifier/rx_notifier.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/usecases.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/summary/states/summary_state.dart';

class SummaryStore {
  final FetchEpisodeByParams fetchEpisodeByParams;

  SummaryStore({this.fetchEpisodeByParams});

  fetchEpisode(EpisodeParams params) async {
    setState(LoadingState());
    var result = await fetchEpisodeByParams.fetch(params);
    setState(result.fold((l) => ErrorState(l), (r) => SuccessState(r)));
  }

  get state => _state;

  RxNotifier<SummaryState> _state = RxNotifier<SummaryState>(StartState());

  void setState(SummaryState value) => _state.value = value;
}