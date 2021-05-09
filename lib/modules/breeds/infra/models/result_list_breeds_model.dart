import 'dart:convert';
import '../../domain/entities/result_list_breeds.dart';

class ResultListBreedsModel extends ResultListBreeds {
  final String breedName;

  ResultListBreedsModel({this.breedName});

  Map<String, dynamic> toMap() {
    return {
      'breedName': breedName,
    };
  }

  factory ResultListBreedsModel.fromMap(String breedName) {
    return ResultListBreedsModel(
      breedName: breedName,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultListBreedsModel.fromJson(String source) =>
      ResultListBreedsModel.fromMap(json.decode(source));
}
