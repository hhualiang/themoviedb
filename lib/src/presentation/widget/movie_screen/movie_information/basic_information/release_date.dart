import 'package:flutter/material.dart';

import '../../../../../../src/core/util/ui_constants.dart';

class ReleaseDate extends StatelessWidget {
  const ReleaseDate({
    super.key,
    required this.releaseDate,
  });

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UiConstants.movieTitleSizedBoxWidth,
      child: Text(
        releaseDate,
        style: const TextStyle(
          fontSize: UiConstants.releaseDateFontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
