import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/external/datasource/tvmaze_datasource.dart';

import '../../utils/tvmaze_response.dart';

class DioSpy extends Mock implements Dio {}

void main() {

  final dio = DioSpy();
  final sut = RemoteTvMazeDatasource(dio);
  
  group('FetchSeries', () {
    test('Should return a list of ResultFetchSerieModel when change Page', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(tvMazeResult), statusCode: 200));
      final future = sut.fetchSeries(1);
      expect(future, completes);
    });

    test('Should return an DatasourceError if statusCode is not 200 when change Page', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(data: null, statusCode: 401));
      final future = sut.fetchSeries(1);
      expect(future, throwsA(isA<DatasourceResultNull>()));
    });

    test('Should return an Exception if exists error in Dio when change Page', () async {
      when(dio.get(any)).thenThrow(Exception());

      final future = sut.fetchSeries(1);
      expect(future, throwsA(isA<Exception>()));
    });
  });

  group('FetchSerieByName', () {
    test('Should return a list of ResultFetchSerieModel when search serie by name', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(tvMazeResultSearchByName), statusCode: 200));
      final future = sut.searchByName('Under the dome');
      expect(future, completes);
    });

    test('Should return an DatasourceError if statusCode is not 200 when search serie by name', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(data: null, statusCode: 401));
      final future = sut.searchByName('Under the dome');
      expect(future, throwsA(isA<DatasourceResultNull>()));
    });

    test('Should return an Exception if exists error in Dio when search serie by name', () async {
      when(dio.get(any)).thenThrow(Exception());

      final future = sut.searchByName('Under the dome');
      expect(future, throwsA(isA<Exception>()));
    });
  });

  group('FetchEpisodeBySerieName', () {
    test('Should return a list of ResultFetchSerieModel with Episodes', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(tvMazeResultSearchByNameWithEpisodes), statusCode: 200));
      final future = sut.fetchEpisodeBySerieName('Under the dome');
      expect(future, completes);
    });

    test('Should return an DatasourceError if statusCode is not 200 when fetch Episodes', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(data: null, statusCode: 401));
      final future = sut.fetchEpisodeBySerieName('Under the dome');
      expect(future, throwsA(isA<DatasourceResultNull>()));
    });

    test('Should return an Exception if exists error in Dio when fetch Episodes', () async {
      when(dio.get(any)).thenThrow(Exception());

      final future = sut.fetchEpisodeBySerieName('Under the dome');
      expect(future, throwsA(isA<Exception>()));
    });
  });

  group('FetchEpisodeByParams', () {
    var params = EpisodeParams(serieNumber: 1, episodeNumber: 1, seasonNumber: 1);

    test('Should return a list of ResultFetchEpisodeSummaryModel', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(tvMazeResultFetchEpisodeByParams), statusCode: 200));
      final future = sut.fetchEpisodeByParams(params);
      expect(future, completes);
    });

    test('Should return an DatasourceError if statusCode is not 200 when FetchEpisodeByParams', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(data: null, statusCode: 401));
      final future = sut.fetchEpisodeByParams(params);
      expect(future, throwsA(isA<DatasourceResultNull>()));
    });

    test('Should return an Exception if exists error in Dio when FetchEpisodeByParams', () async {
      when(dio.get(any)).thenThrow(Exception());
      final future = sut.fetchEpisodeByParams(params);
      expect(future, throwsA(isA<Exception>()));
    });
  });
  
}