import 'package:rx_notifier/rx_notifier.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/usecases.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/detail/states/detail_state.dart';

class DetailStore {
  final FetchSerieEpisodes fetchSerieEpisodes;

  DetailStore({this.fetchSerieEpisodes});

  Future getEpisodes() async {
    setState(LoadingState());
    var result = await fetchSerieEpisodes.fetch(serieName.value);
    setState(result.fold((l) => ErrorState(l), (r) => SuccessState(r)));
  }

  var serieName = RxNotifier<String>('');

  void setSerieName(String value) => serieName.value = value;

  get state => _state;

  RxNotifier<DetailState> _state = RxNotifier<DetailState>(StartState());

  void setState(DetailState value) => _state.value = value;
}