import 'package:pet_ceo/modules/breeds_search/infra/models/result_search_breeds_model.dart';

abstract class SearchBreedsDatasource {
  Future<List<ResultSearchBreedsModel>> getBreeds();
}
