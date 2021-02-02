import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries_maze_challenge_clean/app/app_module.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/home_module.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/detail/detail_store.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/detail/states/detail_state.dart';

import '../../../utils/tvmaze_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  var dio = DioMock();

  initModule(AppModule(), changeBinds: [Bind((i) => dio)]);
  initModule(HomeModule());

  DetailStore sut;

  setUp(() {
    sut = Modular.get<DetailStore>();
    when(dio.get(any)).thenAnswer(
      (_) async => Response(data: jsonDecode(tvMazeResultSearchByNameWithEpisodes), statusCode: 200));
  });

  test('Should return a ResultFetchSerieEpisode', () async {
    sut.setSerieName('Under the dome');
    await sut.getEpisodes();
    expect(sut.state.value.resultFetchSerie, isA<ResultFetchSerie>());
  });

  test('Should return a SuccessState after fetch episodes', () async {
    sut.setSerieName('Under the dome');
    await sut.getEpisodes();
    expect(sut.state.value, isA<SuccessState>());
  });

  test('Should return a SuccessState', () async {
    sut.setState(StartState());
    sut.setState(LoadingState());
    sut.setState(SuccessState(ResultFetchSerie()));
    expect(sut.state.value, isA<SuccessState>());
  });
}