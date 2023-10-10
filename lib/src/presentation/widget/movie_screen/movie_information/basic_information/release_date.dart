import 'package:flutter/material.dart';

import '../../../../../../src/core/util/ui_constants.dart';
import '../../../../../core/util/widget_keys.dart';

class ReleaseDate extends StatelessWidget {
  static const double fontSize = 15;

  const ReleaseDate({
    super.key,
    required this.releaseDate,
  });

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key(WidgetKey.movieDetailsReleaseDate),
      width: UiConstants.movieTitleSizedBoxWidth,
      child: Text(
        releaseDate,
        style: const TextStyle(
          fontSize: fontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
