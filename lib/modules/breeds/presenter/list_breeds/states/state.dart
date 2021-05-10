import 'package:pet_ceo/modules/breeds/domain/entities/result_list_breeds.dart';
import 'package:pet_ceo/modules/breeds/domain/erros/erros.dart';

abstract class ListBreedsState {}

class ListBreedsSuccess implements ListBreedsState {
  final List<ResultListBreeds> list;

  ListBreedsSuccess(this.list);
}

class ListBreedsStart implements ListBreedsState {}

class ListBreedsLoading implements ListBreedsState {}

class ListBreedsError implements ListBreedsState {
  final FailureSearch error;

  ListBreedsError(this.error);
}
