import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:pet_ceo/modules/breeds_search/domain/entities/result_breeds_search.dart';
import 'package:pet_ceo/modules/breeds_search/domain/erros/erros.dart';
import 'package:pet_ceo/modules/breeds_search/infra/datasources/search_breeds_datasource.dart';
import 'package:pet_ceo/modules/breeds_search/infra/models/result_search_breeds_model.dart';

class DogceoDatasource implements SearchBreedsDatasource {
  final Dio dio;

  DogceoDatasource(this.dio);

  @override
  Future<List<ResultSearchBreedsModel>> getBreeds() async {
    final response = await dio.get("https://dog.ceo/api/breeds/list/all");

    if (response.statusCode == 200) {
      final list = (response.data as Map<String, dynamic>)
          .keys
          .map((e) => ResultSearchBreedsModel.fromMap(e))
          .toList();

      return list;
    } else {
      throw DatasourceError();
    }
  }
}
