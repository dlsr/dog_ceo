import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_images.dart';
import 'package:pet_ceo/modules/breeds/domain/usecases/list_images.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breed_images/states/state.dart';

class ListBreedImagesBloc extends Bloc<String, ListBreedImagesState> {
  final ListImages usecase;

  List<ResultListImages> list = [];

  ListBreedImagesBloc(this.usecase) : super(ListBreedImagesStart());

  @override
  Stream<ListBreedImagesState> mapEventToState(String brandName) async* {
    final result = await usecase(brandName);
    yield result.fold((l) => ListBreedImagesError(l), (r) {
      if (list.isEmpty) {
        list = r;
        return ListBreedImagesSuccess(r);
      } else {
        list.addAll(r);
        return ListBreedImagesSuccess(list);
      }
    });
  }
}
