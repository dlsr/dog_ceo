import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pet_ceo/modules/app_module.dart';
import 'package:pet_ceo/modules/app_widget.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
  ));
}
