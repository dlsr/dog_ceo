import 'package:dartz/dartz.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_images.dart';
import '../../domain/erros/erros.dart';
import '../../domain/repositories/breeds_repository.dart';

abstract class ListImages {
  Future<Either<FailureSearch, List<ResultListImages>>> call(String breedName);
}

class ListImagesImpl implements ListImages {
  final BreedsRepository repository;

  ListImagesImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultListImages>>> call(String breedName) {
    return repository.listImages(breedName);
  }
}
