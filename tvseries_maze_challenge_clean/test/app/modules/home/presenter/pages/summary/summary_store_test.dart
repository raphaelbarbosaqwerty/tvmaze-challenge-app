import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries_maze_challenge_clean/app/app_module.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/episode_params.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/home_module.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/summary/states/summary_state.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/summary/summary_store.dart';

import '../../../utils/tvmaze_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  var dio = DioMock();

  initModule(AppModule(), changeBinds: [Bind((i) => dio)]);
  initModule(HomeModule());

  SummaryStore sut;

  setUp(() {
    sut = Modular.get<SummaryStore>();
    when(dio.get(any)).thenAnswer(
      (_) async => Response(data: jsonDecode(tvMazeResultFetchEpisodeByParams), statusCode: 200));
  });
  
  test('Should return a ResultFetchEpisodeSummary', () async {
    var params = EpisodeParams(serieNumber: 1, episodeNumber: 1, seasonNumber: 1);
    await sut.fetchEpisode(params);
    expect(sut.state.value.episode, isA<ResultFetchEpisodeSummary>());
  });

  test('Should return a SuccessState after get result', () async {
    var params = EpisodeParams(serieNumber: 1, episodeNumber: 1, seasonNumber: 1);
    await sut.fetchEpisode(params);
    expect(sut.state.value, isA<SuccessState>());
  });

  test('Should change state value and become a SuccessState at the end', () async {
    sut.setState(StartState());
    sut.setState(LoadingState());
    sut.setState(SuccessState(null));
    expect(sut.state.value, isA<SuccessState>());
  });
}