import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/result_fetch_serie.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/repositories/repositories.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/search_series_by_name.dart';

class HomeRepositorySpy extends Mock implements HomeRepository {}
main() {

  final repository = HomeRepositorySpy();
  final sut = SearchSeriesByName(repository);

  test('Should return a List of FetchSerie', () async {
    when(repository.search(any)).thenAnswer((_) async => Right(<ResultFetchSerie>[]));
    final result = await sut.search('Raphael');
    expect(result | null, isA<List<ResultFetchSerie>>());
  });

  test('Should return an Exception if SerieName is null', () async {
    when(repository.search(any)).thenAnswer((_) async => Right(<ResultFetchSerie>[]));
    final result = await sut.search(null);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}