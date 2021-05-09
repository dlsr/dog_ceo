import 'package:pet_ceo/modules/breeds_search/domain/entities/result_breeds_search.dart';
import 'package:pet_ceo/modules/breeds_search/domain/erros/erros.dart';
import 'package:dartz/dartz.dart';
import 'package:pet_ceo/modules/breeds_search/domain/repositories/search_breed_repository.dart';

abstract class SearchBreeds {
  Future<Either<FailureSearch, List<ResultBreedsSearch>>> call();
}

class SearchBreedsImpl implements SearchBreeds {
  final SearchBreedsRepository repository;

  SearchBreedsImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultBreedsSearch>>> call() {
    return repository.searchBreeds();
  }
}
