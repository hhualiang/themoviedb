import 'package:flutter/material.dart';

import '../../../../utils/ui_constants.dart';
import '../movie_screen_files/movie_information/basic_information/rating.dart';


class HomeScreenMovieRating extends StatelessWidget {
  const HomeScreenMovieRating({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: UiConstants.homeScreenContainerWidth,
      child: RatingDisplay(
        rating: rating,
      ),
    );
  }
}
