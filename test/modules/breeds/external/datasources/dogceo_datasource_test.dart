import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/breeds/domain/erros/erros.dart';
import 'package:pet_ceo/modules/breeds/external/datasources/dogceo_datasource.dart';
import '../../utils/list_breeds_response.dart';
import '../../utils/list_breeds_images_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = DogceoDatasource(dio);
  test("Should return a list of ResultListBreedsModel", () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(listBreedsResponse), statusCode: 200));

    final future = datasource.getBreeds();
    expect(future, completes);
  });

  test("Should return an error if get breeds status code is not 200", () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(listBreedsResponse), statusCode: 401));

    final future = datasource.getBreeds();
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test("Should return an Exception if get breed has dio error", () async {
    when(dio.get(any)).thenThrow(Exception());

    final future = datasource.getBreeds();
    expect(future, throwsA(isA<Exception>()));
  });

  test("Should return a list of ResultListImagesModel", () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(listBreedImagesResponse), statusCode: 200));

    final future = datasource.getBreedImages('');
    expect(future, completes);
  });

  test("Should return an error if get breed images status code is not 200",
      () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
          data: jsonDecode(listBreedImagesResponse),
          statusCode: 401,
        ));

    final future = datasource.getBreedImages('');
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test("Should return an Exception if get breed images has dio error",
      () async {
    when(dio.get(any)).thenThrow(Exception());

    final future = datasource.getBreedImages('');
    expect(future, throwsA(isA<Exception>()));
  });
}
