import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_images.dart';
import 'package:pet_ceo/modules/breeds/domain/erros/erros.dart';
import 'package:pet_ceo/modules/breeds/domain/usecases/list_images.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breed_images/list_breed_images_bloc.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breed_images/states/state.dart';

class ListBreedImagesMock extends Mock implements ListImages {}

main() {
  final usecase = ListBreedImagesMock();
  final bloc = ListBreedImagesBloc(usecase);

  test("Should return sorted states", () {
    when(usecase.call(any))
        .thenAnswer((_) async => Right(<ResultListImages>[]));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<ListBreedImagesSuccess>(),
        ]));

    bloc.add('');
  });

  test("Should return an error", () {
    when(usecase.call(any)).thenAnswer((_) async => Left(InvalidTextError()));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<ListBreedImagesError>(),
        ]));

    bloc.add('');
  });
}
