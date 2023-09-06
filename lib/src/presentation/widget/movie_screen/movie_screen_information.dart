import 'package:flutter/material.dart';

import '../../../domain/entity/movie.dart';
import '../../../../src/core/util/ui_constants.dart';
import '../movie_photos/large_photo.dart';
import '../movie_photos/small_photo_container.dart';
import 'movie_information/basic_information/movie_title.dart';
import 'movie_information/basic_information/rating_row.dart';
import 'movie_information/basic_information/release_date.dart';

class MovieBasicInfoDisplay extends StatelessWidget {
  const MovieBasicInfoDisplay({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            LargePhoto(
              url: movie.backdropPath,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: UiConstants.photoPaddingLeft,
                bottom: UiConstants.photoPaddingBottom,
                top: UiConstants.photoPaddingTop,
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
          bottom: UiConstants.photoPositionBottom,
          left: UiConstants.photoPositionLeft,
          child: SmallPhotoContainer(
            url: movie.posterPath,
          ),
        ),
      ],
    );
  }
}
