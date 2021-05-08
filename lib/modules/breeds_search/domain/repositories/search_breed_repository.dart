import 'package:dartz/dartz.dart';
import 'package:pet_ceo/modules/breeds_search/domain/entities/result_breeds_search.dart';
import 'package:pet_ceo/modules/breeds_search/domain/erros/erros.dart';

abstract class SearchBreedsRepository {
  Future<Either<FailureSearch, List<ResultBreedsSearch>>> searchBreeds();
}
