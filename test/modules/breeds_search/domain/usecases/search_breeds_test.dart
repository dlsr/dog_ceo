import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_breeds.dart';
import 'package:pet_ceo/modules/breeds/domain/repositories/breeds_repository.dart';
import 'package:pet_ceo/modules/breeds/domain/usecases/list_breeds.dart';

class SearchRepositoryMock extends Mock implements BreedsRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchBreedsImpl(repository);

  test('Should return list of ResultSearch', () async {
    when(repository.listBreeds())
        .thenAnswer((_) async => Right(<ResultListBreeds>[]));

    final result = await usecase();

    expect(result.getOrElse(() => null), isA<List<ResultListBreeds>>());
  });
}
