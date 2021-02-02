import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/entities/entities.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/repositories/repositories.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/usecases/fetch_series_by_page.dart';

class HomeRepositorySpy extends Mock implements HomeRepository {}

main() {
  final repository = HomeRepositorySpy();
  final sut = FetchSeriesByPage(repository);

  test('Should return a List of FetchSerie', () async  {
    when(repository.fetch(any)).thenAnswer((realInvocation) async => Right(<ResultFetchSerie>[]));
    final result = await sut.fetch(1);
    expect(result | null, isA<List<ResultFetchSerie>>());
  });

  test('Should return an Exception if pageNumber is null', () async  {
    when(repository.fetch(any)).thenAnswer((realInvocation) async => Right(<ResultFetchSerie>[]));
    final result = await sut.fetch(null);
    expect(result.fold(id, id), isA<InvalidNumberNullError>());
  });
}