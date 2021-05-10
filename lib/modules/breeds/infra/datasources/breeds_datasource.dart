import 'package:pet_ceo/modules/breeds/infra/models/result_list_images_model.dart';
import '../../infra/models/result_list_breeds_model.dart';

abstract class BreedsDatasource {
  Future<List<ResultListBreedsModel>> getBreeds();
  Future<List<ResultListImagesModel>> getBreedImages(String breedName);
}
