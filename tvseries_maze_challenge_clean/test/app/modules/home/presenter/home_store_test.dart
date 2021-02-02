import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries_maze_challenge_clean/app/app_module.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/home_module.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/home_store.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/states/home_state.dart';

import '../utils/tvmaze_response.dart';


class DioMock extends Mock implements Dio {}

void main() {
  var dio = DioMock();

  initModule(AppModule(), changeBinds: [Bind((i) => dio)]);
  initModule(HomeModule());

  HomeStore sut;

  setUp(() {
    sut = Modular.get<HomeStore>();
    when(dio.get(any)).thenAnswer(
      (_) async => Response(data: jsonDecode(tvMazeResult), statusCode: 200));
  });
  
  test('Should return a list of ResultFetchSerie', () async {
    await sut.fetchSeries();
    expect(sut.state.value.list, isA<List<ResultFetchSerie>>());
  });

  test('Should return a SuccessState', () async {
    await sut.setState(StartState());
    await sut.setState(LoadingState());
    await sut.setState(SuccessState(<ResultFetchSerie>[]));
    expect(sut.state.value, isA<SuccessState>());
  });

  test('Should return a list of SuccessState when searched', () async {
    sut.setSerieName('Under the dome');
    await sut.searchSerie();
    expect(sut.state.value, isA<SuccessState>());
  });

  test('Should return a list of ResultFetchSerie when searched', () async {
    sut.setSerieName('Under the dome');
    await sut.searchSerie();
    expect(sut.state.value.list, isA<List<ResultFetchSerie>>());
  });

  test('Should change to the Next Page', () {
    sut.pageNumber.value = 0;
    sut.nextPageNumber();
    expect(sut.pageNumber.value, 1);
  });

  test('Should change to the Back Page', () {
    sut.pageNumber.value = 0;
    sut.nextPageNumber();
    sut.nextPageNumber();

    sut.backPageNumber();
    expect(sut.pageNumber.value, 1);
  });
}