import 'package:dartz/dartz.dart';
import 'package:pet_ceo/modules/breeds_search/domain/entities/result_breeds_search.dart';
import 'package:pet_ceo/modules/breeds_search/domain/erros/erros.dart';
import 'package:pet_ceo/modules/breeds_search/domain/repositories/search_breed_repository.dart';
import 'package:pet_ceo/modules/breeds_search/infra/datasources/search_breeds_datasource.dart';

class SearchBreedsRepositoryImpl implements SearchBreedsRepository {
  final SearchBreedsDatasource datasource;

  SearchBreedsRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultBreedsSearch>>> searchBreeds() async {
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
