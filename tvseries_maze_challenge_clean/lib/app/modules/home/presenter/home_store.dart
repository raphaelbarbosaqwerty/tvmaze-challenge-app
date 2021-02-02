import 'package:rx_notifier/rx_notifier.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/search_series_by_name.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/usecases.dart';

import 'states/home_state.dart';

class HomeStore {
  final FetchSeriesByPage  fetchSeriesByPage;
  final SearchSeriesByName searchSeriesByName;

  HomeStore({this.fetchSeriesByPage, this.searchSeriesByName}) {
    fetchSeries();
  }

  RxNotifier<String> serieName = RxNotifier<String>("");

  void setSerieName(String value) => serieName.value = value;
  
  Future fetchSeries() async {
    setState(LoadingState());
    var result = await fetchSeriesByPage.fetch(pageNumber.value);
    setState(result.fold((l) => ErrorState(l), (r) => SuccessState(r)));
  }

  Future searchSerie() async {
    setState(LoadingState());
    var result = await searchSeriesByName.search(serieName.value);
    var searched = result.fold((l) => ErrorState(l), (r) => SuccessState(r));
    setState(searched);
    return searched;
  }
  
  RxNotifier<HomeState> _state = RxNotifier<HomeState>(StartState());

  get state => _state;

  setState(HomeState value) { 
    _state.value = value;
  }

  RxNotifier<int> pageNumber = RxNotifier<int>(0);

  void nextPageNumber() { 
    pageNumber.value++;
  }

  void backPageNumber() {
    pageNumber.value--;
  }
}