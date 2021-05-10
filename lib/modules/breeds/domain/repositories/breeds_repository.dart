import 'package:dartz/dartz.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_images.dart';
import '../../domain/entities/result_list_breeds.dart';
import '../../domain/erros/erros.dart';

abstract class BreedsRepository {
  Future<Either<FailureSearch, List<ResultListBreeds>>> listBreeds();
  Future<Either<FailureSearch, List<ResultListImages>>> listImages(
      String breedName);
}
