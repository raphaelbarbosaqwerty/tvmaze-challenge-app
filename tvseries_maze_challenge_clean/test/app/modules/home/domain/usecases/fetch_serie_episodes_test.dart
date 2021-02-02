import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/result_fetch_serie.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/repositories/repositories.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/fetch_serie_episodes.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/infra/models/result_fetch_serie_model.dart';

class HomeRepositorySpy extends Mock implements HomeRepository {}

void main() {
  final repository = HomeRepositorySpy();
  final sut = FetchSerieEpisodes(repository);

  test('Should return a List of FetchSerie with Episodes', () async {
    when(repository.fetchEpisodes(any)).thenAnswer((_) async => Right(ResultFetchSerieModel()));
    final result = await sut.fetch('Under the dome');
    expect(result | null, isA<ResultFetchSerie>());
  });

  test('Should return an Exception if serie name is null', () async {
    when(repository.fetchEpisodes(any)).thenAnswer((_) async => Right(ResultFetchSerieModel()));
    final result = await sut.fetch(null);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}