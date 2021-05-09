import 'package:dartz/dartz.dart';
import '../../domain/entities/result_list_breeds.dart';
import '../../domain/erros/erros.dart';

abstract class BreedsRepository {
  Future<Either<FailureSearch, List<ResultListBreeds>>> listBreeds();
}
