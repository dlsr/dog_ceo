import '../../infra/models/result_list_breeds_model.dart';

abstract class BreedsDatasource {
  Future<List<ResultListBreedsModel>> getBreeds();
}
