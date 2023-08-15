import 'package:flutter/material.dart';

import '/utils/ui_text.dart';
import 'widgets/core/screens/screen_movie_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: UiText.appTitle,
      home: ScreenMovieDetails(),
    );
  }
}
