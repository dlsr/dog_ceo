import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_ceo/modules/breeds/domain/usecases/list_images.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breed_images/states/state.dart';

class ListBreedImagesBloc extends Bloc<String, ListBreedImagesState> {
  final ListImages usecase;
  ListBreedImagesBloc(this.usecase) : super(ListBreedImagesStart());

  @override
  Stream<ListBreedImagesState> mapEventToState(String brandName) async* {
    yield ListBreedImagesLoading();
    final result = await usecase(brandName);
    yield result.fold(
        (l) => ListBreedImagesError(l), (r) => ListBreedImagesSuccess(r));
  }
}
