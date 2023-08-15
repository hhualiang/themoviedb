import 'package:flutter/material.dart';

import '/widgets/custom_widgets.dart';
import '../movie_information/movie_photos/large_photo.dart';

class MovieBasicInfoDisplay extends StatelessWidget {
  const MovieBasicInfoDisplay({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Column(
          children: [
            LargePhoto(
              url: movie.largePhotoURL,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: UiConstants.photoPaddingLeft,
                bottom: UiConstants.photoPaddingBottom,
                top: UiConstants.photoPaddingTop,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MovieTitle(
                    title: movie.title,
                  ),
                  ReleaseDate(
                    releaseDate: movie.releaseDate,
                  ),
                  RatingRow(
                    rating: movie.rating,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: UiConstants.photoPositionTop,
          left: UiConstants.photoPositionLeft,
          child: SmallPhotoContainer(
            url: movie.smallPhotoURL,
          ),
        ),
      ],
    );
  }
}
