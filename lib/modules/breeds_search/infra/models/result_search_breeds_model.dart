import 'dart:convert';

import 'package:pet_ceo/modules/breeds_search/domain/entities/result_breeds_search.dart';

class ResultSearchBreedsModel extends ResultBreedsSearch {
  final String breedName;

  ResultSearchBreedsModel({this.breedName});

  Map<String, dynamic> toMap() {
    return {
      'breedName': breedName,
    };
  }

  factory ResultSearchBreedsModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchBreedsModel(
      breedName: map['breedName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchBreedsModel.fromJson(String source) =>
      ResultSearchBreedsModel.fromMap(json.decode(source));
}
