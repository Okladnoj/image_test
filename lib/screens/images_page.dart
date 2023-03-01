import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../interfaces/images_interface.dart';
import '../models/image_model.dart';

class ImagesPage extends StatelessWidget {
  final ImagesInterface repository;
  const ImagesPage({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Images page'),
      ),
      body: FutureBuilder<List<ImageModel>>(
        future: repository.getImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No images available'));
          } else {
            List<ImageModel> images = snapshot.data!;
            return GridView.builder(
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                ImageModel image = images[index];
                return FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: image.path,
                  fit: BoxFit.contain,
                );
              },
            );
          }
        },
      ),
    );
  }
}
