import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pet_ceo/modules/app_widget.dart';
import 'package:pet_ceo/modules/breeds_search/domain/usecases/search_breeds.dart';
import 'package:pet_ceo/modules/breeds_search/external/datasources/dogceo_datasource.dart';
import 'package:pet_ceo/modules/breeds_search/infra/repositories/search_breeds_repository_impl.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => DogceoDatasource(i())),
        Bind((i) => SearchBreedsRepositoryImpl(i())),
        Bind((i) => SearchBreedsImpl(i())),
      ];

  @override
  List<ModularRouter> get routers => [];

  @override
  Widget get bootstrap => AppWidget();
}
