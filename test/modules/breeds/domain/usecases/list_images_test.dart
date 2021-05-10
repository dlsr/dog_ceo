import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_images.dart';
import 'package:pet_ceo/modules/breeds/domain/repositories/breeds_repository.dart';
import 'package:pet_ceo/modules/breeds/domain/usecases/list_images.dart';

class RepositoryMock extends Mock implements BreedsRepository {}

main() {
  final repository = RepositoryMock();
  final usecase = ListImagesImpl(repository);

  test('Should return list of ResultListImages', () async {
    when(repository.listImages(any))
        .thenAnswer((_) async => Right(<ResultListImages>[]));

    final result = await usecase.call('any');

    expect(result.getOrElse(() => null), isA<List<ResultListImages>>());
  });
}
