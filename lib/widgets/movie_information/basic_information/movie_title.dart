import 'package:flutter/material.dart';

import '../../../utils/ui_constants.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UiConstants.movieTitleSizedBoxWidth,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: UiConstants.movieTitleTitleFontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
