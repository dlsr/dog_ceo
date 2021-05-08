import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/breeds_search/domain/entities/result_breeds_search.dart';
import 'package:pet_ceo/modules/breeds_search/domain/repositories/search_breed_repository.dart';
import 'package:pet_ceo/modules/breeds_search/domain/usecases/search_breeds.dart';

class SearchRepositoryMock extends Mock implements SearchBreedsRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchBreedsImpl(repository: repository);

  test('Should return list of ResultSearch', () async {
    when(repository.searchBreeds())
        .thenAnswer((_) async => Right(<ResultBreedsSearch>[]));

    final result = await usecase();

    expect(result.getOrElse(() => null), isA<List<ResultBreedsSearch>>());
  });
}
