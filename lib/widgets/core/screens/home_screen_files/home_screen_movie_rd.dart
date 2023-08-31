import 'package:flutter/material.dart';

import '../../../../utils/ui_constants.dart';
import '../../../../utils/ui_text.dart';

class HomeScreenMovieReleaseDate extends StatelessWidget {
  const HomeScreenMovieReleaseDate({
    super.key,
    required this.releaseDate,
  });

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${UiText.homeScreenReleaseDate} $releaseDate',
      style: const TextStyle(
        color: Colors.white,
        fontSize: UiConstants.homeScreenReleaseDateFontSize,
      ),
    );
  }
}
