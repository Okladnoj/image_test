import 'package:flutter/material.dart';

import 'repositories/images_repo.dart';
import 'screens/images_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImagesPage(
        repository: ImagesRepo(),
      ),
    );
  }
}
