import 'package:flutter/material.dart';

import '/utils/ui_constants.dart';

class GenresText extends StatelessWidget {
  const GenresText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: UiConstants.genresTextPaddingHorizontal,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UiConstants.genresTextBorderRadius),
        border: Border.all(
          color: Colors.grey,
          width: UiConstants.genresTextContainerBorderWidth,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: UiConstants.genresTextTextFontSize,
        ),
      ),
    );
  }
}
