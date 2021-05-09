import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pet_ceo/modules/app_widget.dart';

import 'breeds/domain/usecases/list_breeds.dart';
import 'breeds/external/datasources/dogceo_datasource.dart';
import 'breeds/infra/repositories/breeds_repository_impl.dart';
import 'breeds/presenter/search_breeds/search_breeds_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => DogceoDatasource(i())),
        Bind((i) => BreedsRepositoryImpl(i())),
        Bind((i) => SearchBreedsImpl(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SearchBreedsPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
