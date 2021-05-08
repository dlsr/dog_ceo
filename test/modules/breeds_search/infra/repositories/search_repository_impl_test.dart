import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/breeds_search/domain/entities/result_breeds_search.dart';
import 'package:pet_ceo/modules/breeds_search/domain/erros/erros.dart';
import 'package:pet_ceo/modules/breeds_search/infra/datasources/search_breeds_datasource.dart';
import 'package:pet_ceo/modules/breeds_search/infra/models/result_search_breeds_model.dart';
import 'package:pet_ceo/modules/breeds_search/infra/repositories/search_breeds_repository_impl.dart';

class SearchDatasourceMock extends Mock implements SearchBreedsDatasource {}

main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchBreedsRepositoryImpl(datasource);

  test('Should return ResultSearch list', () async {
    when(datasource.getBreeds())
        .thenAnswer((_) async => <ResultSearchBreedsModel>[]);
    final result = await repository.searchBreeds();
    expect(result.getOrElse(() => null), isA<List<ResultBreedsSearch>>());
  });

  test('Should return DatasourceError when datasource fails', () async {
    when(datasource.getBreeds()).thenThrow(Exception());
    final result = await repository.searchBreeds();
    expect(result.fold((l) => l, (r) => r), isA<DatasourceError>());
  });
}
