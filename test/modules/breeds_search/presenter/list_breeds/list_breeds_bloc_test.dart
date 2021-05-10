import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_ceo/modules/breeds/domain/entities/result_list_breeds.dart';
import 'package:pet_ceo/modules/breeds/domain/erros/erros.dart';
import 'package:pet_ceo/modules/breeds/domain/usecases/list_breeds.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breeds/list_breeds_bloc.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breeds/states/state.dart';

class ListBreedsMock extends Mock implements ListBreeds {}

main() {
  final usecase = ListBreedsMock();
  final bloc = ListBreedsBloc(usecase);

  test("Should return sorted states", () {
    when(usecase.call()).thenAnswer((_) async => Right(<ResultListBreeds>[]));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<ListBreedsLoading>(),
          isA<ListBreedsSuccess>(),
        ]));

    bloc.add(Events.fetch);
  });

  test("Should return an error", () {
    when(usecase.call()).thenAnswer((_) async => Left(InvalidTextError()));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<ListBreedsLoading>(),
          isA<ListBreedsError>(),
        ]));

    bloc.add(Events.fetch);
  });
}
