import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_breeds.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_images.dart';
import 'package:pet_ceo/modules/breeds/domain/erros/erros.dart';
import 'package:pet_ceo/modules/breeds/infra/datasources/breeds_datasource.dart';
import 'package:pet_ceo/modules/breeds/infra/models/result_list_breeds_model.dart';
import 'package:pet_ceo/modules/breeds/infra/models/result_list_images_model.dart';
import 'package:pet_ceo/modules/breeds/infra/repositories/breeds_repository_impl.dart';

class ListDatasourceMock extends Mock implements BreedsDatasource {}

main() {
  final datasource = ListDatasourceMock();
  final repository = BreedsRepositoryImpl(datasource);

  test('Should return list of ResultListBreeds', () async {
    when(datasource.getBreeds())
        .thenAnswer((_) async => <ResultListBreedsModel>[]);
    final result = await repository.listBreeds();
    expect(result.getOrElse(() => null), isA<List<ResultListBreeds>>());
  });

  test('Should return DatasourceError when datasource getBreeds fails',
      () async {
    when(datasource.getBreeds()).thenThrow(Exception());
    final result = await repository.listBreeds();
    expect(result.fold((l) => l, (r) => r), isA<DatasourceError>());
  });

  test('Should return list of ResultListImages', () async {
    when(datasource.getBreedImages(any))
        .thenAnswer((_) async => <ResultListImagesModel>[]);
    final result = await repository.listImages('');
    expect(result.getOrElse(() => null), isA<List<ResultListImages>>());
  });

  test('Should return DatasourceError when datasource getBreedImages fails',
      () async {
    when(datasource.getBreedImages(any)).thenThrow(Exception());
    final result = await repository.listImages('');
    expect(result.fold((l) => l, (r) => r), isA<DatasourceError>());
  });
}
