import 'package:flutter/material.dart';

import '../../../../../../src/core/util/ui_constants.dart';
import '../../../../../core/util/widget_keys.dart';

class MovieTitle extends StatelessWidget {
  static const double fontSize = 20;

  const MovieTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key(WidgetKey.movieDetailsMovieTitle),
      width: UiConstants.movieTitleSizedBoxWidth,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: fontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
