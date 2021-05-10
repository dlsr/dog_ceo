import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/app_module.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_breeds.dart';
import 'package:pet_ceo/modules/breeds/domain/usecases/list_breeds.dart';
import 'modules/breeds_search/utils/list_breeds_images_response.dart';
import 'modules/breeds_search/utils/list_breeds_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);
  test('Should run usecase without error', () {
    final usecase = Modular.get<ListBreeds>();
    expect(usecase, isA<ListBreedsImpl>());
  });
  test('Should return a list of ResultBreedsSearch', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(listBreedsResponse), statusCode: 200));

    final usecase = Modular.get<ListBreeds>();
    final result = await usecase.call();
    expect(result.getOrElse(() => null), isA<List<ResultListBreeds>>());
  });
}
