import 'package:flutter/material.dart';

import '../../../../core/util/widget_keys.dart';

class GenresText extends StatelessWidget {
  static const double _horizontalPadding = 5;
  static const double _borderRadius = 30;
  static const double _containerBorderWidth = 3;
  static const double _textFontSize = 16;

  const GenresText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key(WidgetKey.genresText),
      padding: const EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(
          color: Colors.grey,
          width: _containerBorderWidth,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: _textFontSize,
        ),
      ),
    );
  }
}
