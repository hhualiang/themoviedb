import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';

class HomeScreenMovieRating extends StatelessWidget {
  static const int _movieRatingDividedByTwo = 2;
  static const int _maxStarNumber = 5;
  static const double _sizedBoxWidth = 10;
  static const double _circleAvatarRadius = 15;
  static const double _fontSize = 13;
  final num rating;

  const HomeScreenMovieRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  Icon generateStars(
    num rating,
    int starNumber,
  ) {
    final double movieRating = rating / _movieRatingDividedByTwo;
    int filledStars = movieRating.floor() - starNumber;
    double halfStar = movieRating - starNumber;
    if (filledStars > 0) {
      return const Icon(
        Icons.star,
        color: Colors.amber,
      );
    } else if (halfStar > 0) {
      return const Icon(
        Icons.star_half,
        color: Colors.amber,
      );
    } else {
      return const Icon(
        Icons.star_border,
        color: Colors.amber,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key(WidgetKey.homeScreenMovieRating),
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int starNumber = 0; starNumber < _maxStarNumber; starNumber++)
          generateStars(
            rating,
            starNumber,
          ),
        const SizedBox(
          width: _sizedBoxWidth,
        ),
        CircleAvatar(
          radius: _circleAvatarRadius,
          backgroundColor: Colors.amber,
          child: Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: _fontSize,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
