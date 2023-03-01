import 'package:flutter/material.dart';

import '../models/image_model.dart';

@immutable
abstract class ImagesInterface {
  Future<List<ImageModel>> getImages();
}
