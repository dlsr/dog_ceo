import 'dart:convert';

import 'package:pet_ceo/modules/breeds/domain/entities/result_list_images.dart';

class ResultListImagesModel extends ResultListImages {
  final String imageUrl;

  ResultListImagesModel(this.imageUrl);

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
    };
  }

  factory ResultListImagesModel.fromMap(String value) {
    return ResultListImagesModel(
      value,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultListImagesModel.fromJson(String source) =>
      ResultListImagesModel.fromMap(json.decode(source));
}
