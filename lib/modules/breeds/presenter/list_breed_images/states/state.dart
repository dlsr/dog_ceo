import 'package:pet_ceo/modules/breeds/domain/entities/result_list_images.dart';
import 'package:pet_ceo/modules/breeds/domain/erros/erros.dart';

abstract class ListBreedImagesState {}

class ListBreedImagesSuccess implements ListBreedImagesState {
  final List<ResultListImages> list;

  ListBreedImagesSuccess(this.list);
}

class ListBreedImagesStart implements ListBreedImagesState {}

class ListBreedImagesLoading implements ListBreedImagesState {}

class ListBreedImagesError implements ListBreedImagesState {
  final FailureSearch error;

  ListBreedImagesError(this.error);
}
