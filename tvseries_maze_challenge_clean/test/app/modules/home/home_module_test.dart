import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries_maze_challenge_clean/app/app_module.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/search_series_by_name.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/usecases.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/external/datasource/datasource.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/home_module.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/models.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/repositories/repositories.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/home_store.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/detail/detail_store.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/pages/summary/summary_store.dart';

import 'utils/tvmaze_response.dart';

class DioSpy extends Mock implements Dio {}

main() {

  final dio = DioSpy();
  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);

  initModule(HomeModule());

  test('Should recover HomeStore without error', () {
    final usecase = Modular.get<HomeStore>();
    expect(usecase, isA<HomeStore>());
  });

  test('Should recover usercase IFetchSeriesByPage without error', () {
    final usecase = Modular.get<IFetchSeriesByPage>();
    expect(usecase, isA<IFetchSeriesByPage>());
  });

  test('Should fetch a list of ResultFetchSerie after get the bind in Modular and change page', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(tvMazeResult), statusCode: 200));
    final usecase = Modular.get<IFetchSeriesByPage>();
    final result = await usecase.fetch(1);

    expect(result | null, isA<List<ResultFetchSerie>>());
  });

  test('Should recover usercase ISearchSeriesByName without error', () {
    final usecase = Modular.get<ISearchSeriesByName>();
    expect(usecase, isA<ISearchSeriesByName>());
  });

  test('Should fetch a list of ResultFetchSerie after get the bind in Modular and seacrh by name', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(tvMazeResultSearchByName), statusCode: 200));
    final usecase = Modular.get<ISearchSeriesByName>();
    final result = await usecase.search('Under the Dome');
    expect(result | null, isA<List<ResultFetchSerie>>());
  });

  test('Should recover usercase IFetchSerieEpisodes without error', () {
    final usecase = Modular.get<IFetchSerieEpisodes>();
    expect(usecase, isA<IFetchSerieEpisodes>());
  });

  test('Should fetch a list of ResultFetchSerieModel after get the bind in Modular', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(tvMazeResultSearchByNameWithEpisodes), statusCode: 200));
    final usecase = Modular.get<IFetchSerieEpisodes>();
    final result = await usecase.fetch('Under the Dome');
    expect(result | null, isA<ResultFetchSerieModel>());
  });

  test('Should recover usercase IFetchEpisodeByParams without error', () {
    final usecase = Modular.get<IFetchEpisodeByParams>();
    expect(usecase, isA<IFetchEpisodeByParams>());
  });

  test('Should fetch a list of ResultFetchEpisodeSummaryModel after get the bind in Modular', () async {
    var params = EpisodeParams(serieNumber: 1, episodeNumber: 1, seasonNumber: 1);
    when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(tvMazeResultFetchEpisodeByParams), statusCode: 200));
    final usecase = Modular.get<IFetchEpisodeByParams>();
    final result = await usecase.fetch(params);
    expect(result | null, isA<ResultFetchEpisodeSummaryModel>());
  });

  test('Should recover HomeRepositoryAdapter without error from Modular', () {
    final usecase = Modular.get<HomeRepositoryAdapter>();
    expect(usecase, isA<HomeRepositoryAdapter>());
  });

  test('Should recover RemoteTvMazeDatasource without error from Modular', () {
    final usecase = Modular.get<RemoteTvMazeDatasource>();
    expect(usecase, isA<RemoteTvMazeDatasource>());
  });

  test('Should recover DetailStore without error from Modular', () {
    final usecase = Modular.get<DetailStore>();
    expect(usecase, isA<DetailStore>());
  });

  test('Should recover SummaryStore without error from Modular', () {
    final usecase = Modular.get<SummaryStore>();
    expect(usecase, isA<SummaryStore>());
  });
}