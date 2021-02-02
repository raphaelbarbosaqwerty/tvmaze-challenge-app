import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/repositories/home_repository.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/usecases.dart';

class HomeRepositorySpy extends Mock implements HomeRepository {}

void main() {

  final repository = HomeRepositorySpy();
  final sut = FetchEpisodeByParams(repository);
  test('Should return a FetchEpisodeSummary when FetchEpisodeByNumberParams', () async {
    var params = EpisodeParams(serieNumber: 3, episodeNumber: 3, seasonNumber: 3);
    when(repository.fetchEpisodeByParams(params)).thenAnswer((realInvocation) async => Right(ResultFetchEpisodeSummary()));
    final result = await sut.fetch(params);
    expect(result | null, isA<ResultFetchEpisodeSummary>());
  });

  test('Should return an Expcetion if serieNumber is Null', () async {
    var params = EpisodeParams(serieNumber: null, episodeNumber: 1, seasonNumber: 1);
    when(repository.fetchEpisodeByParams(params)).thenAnswer((realInvocation) async => Right(ResultFetchEpisodeSummary()));
    final result = await sut.fetch(params);
    expect(result.fold(id, id), isA<InvalidNumberNullError>());
  });

  test('Should return an Expcetion if episodeNumber is Null', () async {
    var params = EpisodeParams(serieNumber: 1, episodeNumber: null, seasonNumber: 1);
    when(repository.fetchEpisodeByParams(params)).thenAnswer((realInvocation) async => Right(ResultFetchEpisodeSummary()));
    final result = await sut.fetch(params);
    expect(result.fold(id, id), isA<InvalidNumberNullError>());
  });

  test('Should return an Expcetion if seasonNumber is Null', () async {
    var params = EpisodeParams(serieNumber: 3, episodeNumber: 3, seasonNumber: null);
    when(repository.fetchEpisodeByParams(params)).thenAnswer((realInvocation) async => Right(ResultFetchEpisodeSummary()));
    final result = await sut.fetch(params);
    expect(result.fold(id, id), isA<InvalidNumberNullError>());
  });
}