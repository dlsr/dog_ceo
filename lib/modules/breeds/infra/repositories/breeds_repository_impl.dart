import 'package:dartz/dartz.dart';
import '../../domain/entities/result_list_breeds.dart';
import '../../domain/erros/erros.dart';

import '../../domain/repositories/breeds_repository.dart';
import '../../infra/datasources/breeds_datasource.dart';

class BreedsRepositoryImpl implements BreedsRepository {
  final BreedsDatasource datasource;

  BreedsRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultListBreeds>>> listBreeds() async {
    try {
      final result = await datasource.getBreeds();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
