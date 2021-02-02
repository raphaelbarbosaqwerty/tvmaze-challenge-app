import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/result_fetch_serie.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/datasources/home_datasource_adapter.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/models.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/result_fetch_serie_model.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/repositories/home_repository_adapter.dart';

class HomeDatasourceSpy extends Mock implements HomeDatasourceAdapter {}
void main() {
  
  final datasource = HomeDatasourceSpy();
  final sut = HomeRepositoryAdapter(datasource);
  
  test('Should return a list of ResultFetchSerie if change Page', () async {
    when(datasource.fetchSeries(any)).thenAnswer((_) async => <ResultFetchSerieModel>[]);
  
    final result = await sut.fetch(1);

    expect(result | null, isA<List<ResultFetchSerie>>());
  });

  test('Should return an DatasourceError if datasource fails if change Page', () async {
    when(datasource.fetchSeries(any)).thenThrow(Exception());
  
    final result = await sut.fetch(1);
    expect(result.fold(id, id), isA<DatasourceResultNull>());
  });

  test('Should return a list of ResultFetchSerie if search by name', () async {
    when(datasource.searchByName(any)).thenAnswer((_) async => <ResultFetchSerieModel>[]);

    final result = await sut.search('Under the dome');
    expect(result | null, isA<List<ResultFetchSerie>>());
  });

  test('Should return an DatasourceError if datasource fails when search by name', () async {
    when(datasource.searchByName(any)).thenThrow(Exception());

    final result = await sut.search('Under the dome');
    expect(result.fold(id, id), isA<DatasourceResultNull>());
  });

  test('Should return a list of ResultFetchSerie with Episodes', () async {
    when(datasource.fetchEpisodeBySerieName(any)).thenAnswer((_) async => ResultFetchSerieModel());

    final result = await sut.fetchEpisodes('Under the dome');
    expect(result | null, isA<ResultFetchSerie>());
  });

  test('Should return an DatasourceError if datasource when try to fetch a list of Episodes', () async {
    when(datasource.fetchEpisodeBySerieName(any)).thenThrow(Exception());

    final result = await sut.fetchEpisodes('Under the dome');
    expect(result.fold(id, id), isA<DatasourceResultNull>());
  });

  test('Should return a list of ResultFetchEpisodeSummary', () async {
    var params = EpisodeParams(serieNumber: 1, episodeNumber: 1, seasonNumber: 1);
    when(datasource.fetchEpisodeByParams(any)).thenAnswer((_) async => ResultFetchEpisodeSummaryModel());

    final result = await sut.fetchEpisodeByParams(params);
    expect(result | null, isA<ResultFetchEpisodeSummary>());
  });

  test('Should return an DatasourceError if fails when try to search an Episode by Params', () async {
    var params = EpisodeParams(serieNumber: 1, episodeNumber: 1, seasonNumber: 1);
    when(datasource.fetchEpisodeByParams(any)).thenThrow(Exception());

    final result = await sut.fetchEpisodeByParams(params);
    expect(result.fold(id, id), isA<DatasourceResultNull>());
  });
}