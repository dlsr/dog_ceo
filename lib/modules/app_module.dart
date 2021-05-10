import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pet_ceo/modules/app_widget.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breed_images/list_breed_images_bloc.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breed_images/list_breed_images_page.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breeds/list_breeds_bloc.dart';
import 'breeds/domain/usecases/list_breeds.dart';
import 'breeds/domain/usecases/list_images.dart';
import 'breeds/external/datasources/dogceo_datasource.dart';
import 'breeds/infra/repositories/breeds_repository_impl.dart';
import 'breeds/presenter/list_breeds/list_breeds_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => DogceoDatasource(i())),
        Bind((i) => BreedsRepositoryImpl(i())),
        Bind((i) => ListBreedsImpl(i())),
        Bind((i) => ListImagesImpl(i())),
        Bind((i) => ListBreedsBloc(i())),
        Bind((i) => ListBreedImagesBloc(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => ListBreedsPage()),
        ModularRouter('/list_breed_images',
            child: (_, args) =>
                ListBreedImagesPage(breedName: args.data['breedName'])),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
