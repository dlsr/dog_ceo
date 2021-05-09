import 'package:dartz/dartz.dart';
import '../../domain/entities/result_list_breeds.dart';
import '../../domain/erros/erros.dart';
import '../../domain/repositories/breeds_repository.dart';

abstract class ListBreeds {
  Future<Either<FailureSearch, List<ResultListBreeds>>> call();
}

class SearchBreedsImpl implements ListBreeds {
  final BreedsRepository repository;

  SearchBreedsImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultListBreeds>>> call() {
    return repository.listBreeds();
  }
}
