import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';
import '../../../domain/entity/movie.dart';
import '../movie_photos/large_photo.dart';
import '../movie_photos/small_photo_container.dart';
import 'movie_information/basic_information/movie_title.dart';
import 'movie_information/basic_information/rating_row.dart';
import 'movie_information/basic_information/release_date.dart';

class MovieBasicInfoDisplay extends StatelessWidget {
  static const double _positionBottom = 10;
  static const double _positionLeft = 20;
  static const double _paddingLeft = 170;
  static const double _paddingTop = 30;
  static const double _paddingBottom = 40;

  const MovieBasicInfoDisplay({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: const Key(WidgetKey.movieBasicInfoDisplay),
      children: <Widget>[
        Column(
          children: <Widget>[
            LargePhoto(
              url: movie.backdropPath,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: _paddingLeft,
                bottom: _paddingBottom,
                top: _paddingTop,
              ),
              child: Column(
                children: <Widget>[
                  MovieTitle(
                    title: movie.title,
                  ),
                  ReleaseDate(
                    releaseDate: movie.releaseDate,
                  ),
                  RatingRow(
                    rating: movie.movieRating.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: _positionBottom,
          left: _positionLeft,
          child: SmallPhotoContainer(
            url: movie.posterPath,
          ),
        ),
      ],
    );
  }
}
