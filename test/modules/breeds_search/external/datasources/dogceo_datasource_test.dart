import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/breeds_search/domain/erros/erros.dart';
import 'package:pet_ceo/modules/breeds_search/external/datasources/dogceo_datasource.dart';

import '../../utils/dogceo_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = DogceoDatasource(dio);
  test("Should return a list of ResultSearchModel ", () async {
    // var customHeaders = {
    //   'content-type': 'application/json'
    //   // other headers
    // };

    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(dogceoResponse), statusCode: 200));

    final future = datasource.getBreeds();
    expect(future, completes);
  });

  test("Should return an error if status code is not 200", () async {
    // var customHeaders = {
    //   'content-type': 'application/json'
    //   // other headers
    // };

    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(dogceoResponse), statusCode: 401));

    final future = datasource.getBreeds();
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test("Should return an Exception se has dio error", () async {
    when(dio.get(any)).thenThrow(Exception());

    final future = datasource.getBreeds();
    expect(future, throwsA(isA<Exception>()));
  });
}
