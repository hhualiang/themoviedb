import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';

class HomeScreenMovieTitle extends StatelessWidget {
  static const double _fontSize = 16;

  const HomeScreenMovieTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const Key(WidgetKey.homeScreenMovieTitle),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: _fontSize,
        ),
      ),
    );
  }
}
