import 'package:dio/dio.dart';
import 'package:pet_ceo/modules/breeds/domain/erros/erros.dart';
import 'package:pet_ceo/modules/breeds/infra/models/result_list_images_model.dart';
import '../../domain/erros/erros.dart';
import '../../infra/datasources/breeds_datasource.dart';
import '../../infra/models/result_list_breeds_model.dart';

class DogceoDatasource implements BreedsDatasource {
  final Dio dio;

  DogceoDatasource(this.dio);

  @override
  Future<List<ResultListBreedsModel>> getBreeds() async {
    final response = await dio.get("https://dog.ceo/api/breeds/list/all");

    if (response.statusCode == 200) {
      final list = (response.data["message"] as Map<String, dynamic>)
          .keys
          .map((e) => ResultListBreedsModel.fromMap(e))
          .toList();

      return list;
    } else {
      throw DatasourceError();
    }
  }

  @override
  Future<List<ResultListImagesModel>> getBreedImages(String breedName) async {
    final response =
        await dio.get("https://dog.ceo/api/breed/$breedName/images");

    if (response.statusCode == 200) {
      final list = (response.data["message"] as List)
          .map((e) => ResultListImagesModel.fromMap(e))
          .toList();

      return list;
    } else {
      throw DatasourceError();
    }
  }
}
