import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/app_constants.dart';
import '../interfaces/images_interface.dart';
import '../models/image_model.dart';

@immutable
class ImagesRepo implements ImagesInterface {
  const ImagesRepo();

  @override
  Future<List<ImageModel>> getImages() async {
    final result = await http.get(Uri.parse(AppConstants.apiUrl));

    if (result.statusCode != 200) throw 'Status code ${result.statusCode}';

    final hits = jsonDecode(result.body)['hits'];

    if (hits is List) {
      return hits.map((hit) => ImageModel(hit['webformatURL'])).toList();
    }

    print(hits);

    return [];
  }
}
