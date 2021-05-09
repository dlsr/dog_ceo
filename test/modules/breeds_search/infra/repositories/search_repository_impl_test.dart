import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_breeds.dart';
import 'package:pet_ceo/modules/breeds/domain/erros/erros.dart';
import 'package:pet_ceo/modules/breeds/infra/datasources/breeds_datasource.dart';
import 'package:pet_ceo/modules/breeds/infra/models/result_list_breeds_model.dart';
import 'package:pet_ceo/modules/breeds/infra/repositories/breeds_repository_impl.dart';

class SearchDatasourceMock extends Mock implements BreedsDatasource {}

main() {
  final datasource = SearchDatasourceMock();
  final repository = BreedsRepositoryImpl(datasource);

  test('Should return ResultSearch list', () async {
    when(datasource.getBreeds())
        .thenAnswer((_) async => <ResultListBreedsModel>[]);
    final result = await repository.listBreeds();
    expect(result.getOrElse(() => null), isA<List<ResultListBreeds>>());
  });

  test('Should return DatasourceError when datasource fails', () async {
    when(datasource.getBreeds()).thenThrow(Exception());
    final result = await repository.listBreeds();
    expect(result.fold((l) => l, (r) => r), isA<DatasourceError>());
  });
}
