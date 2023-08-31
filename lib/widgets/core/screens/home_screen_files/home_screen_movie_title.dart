import 'package:flutter/material.dart';

import '../../../../utils/ui_constants.dart';
import '../../../../utils/ui_text.dart';

class HomeScreenMovieTitle extends StatelessWidget {
  const HomeScreenMovieTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UiConstants.homeScreenContainerWidth,
      child: Text(
        '${UiText.homeScreenMovieTitle} $title',
        style: const TextStyle(
          color: Colors.white,
          fontSize: UiConstants.homeScreenMovieTitleTextFontSize,
        ),
      ),
    );
  }
}
