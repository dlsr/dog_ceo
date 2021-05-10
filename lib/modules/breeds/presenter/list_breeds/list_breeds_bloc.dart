import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_ceo/modules/breeds/domain/usecases/list_breeds.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breeds/states/state.dart';

enum Events { fetch }

class ListBreedsBloc extends Bloc<Events, ListBreedsState> {
  final ListBreeds usecase;

  ListBreedsBloc(this.usecase) : super(ListBreedsStart());

  @override
  Stream<ListBreedsState> mapEventToState(Events listEvent) async* {
    yield ListBreedsLoading();
    final result = await usecase();
    yield result.fold((l) => ListBreedsError(l), (r) => ListBreedsSuccess(r));
  }
}
