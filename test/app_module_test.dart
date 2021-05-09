import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/app_module.dart';
import 'package:pet_ceo/modules/breeds_search/domain/entities/result_breeds_search.dart';
import 'package:pet_ceo/modules/breeds_search/domain/usecases/search_breeds.dart';

import 'modules/breeds_search/utils/dogceo_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);
  test('Should run usecase without error', () {
    final usecase = Modular.get<SearchBreeds>();
    expect(usecase, isA<SearchBreedsImpl>());
  });
  test('Should return a list of ResultBreedsSearch', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(dogceoResponse), statusCode: 200));

    final usecase = Modular.get<SearchBreeds>();
    final result = await usecase.call();
    expect(result.getOrElse(() => null), isA<List<ResultBreedsSearch>>());
  });
}
