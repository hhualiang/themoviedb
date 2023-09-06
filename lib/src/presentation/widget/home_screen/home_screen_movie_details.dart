import 'package:flutter/material.dart';

import '../../../domain/entity/movie.dart';
import '../../../../src/core/util/ui_constants.dart';
import '../movie_photos/small_photo_container.dart';
import 'home_screen_like_icon.dart';
import 'home_screen_movie_rating.dart';
import 'home_screen_movie_rd.dart';
import 'home_screen_movie_title.dart';

class HomeScreenMovieDetails extends StatelessWidget {
  const HomeScreenMovieDetails({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SmallPhotoContainer(
          url: movie.posterPath,
        ),
        Padding(
          padding: const EdgeInsets.all(
            UiConstants.homeScreenMovieRowInformationPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HomeScreenMovieTitle(
                title: movie.title,
              ),
              HomeScreenMovieReleaseDate(
                releaseDate: movie.releaseDate,
              ),
              const SizedBox(
                height: UiConstants.homeScreenSizedBoxSpacerHeight,
              ),
              HomeScreenMovieRating(
                rating: movie.movieRating.toString(),
              ),
              const SizedBox(
                height: UiConstants.homeScreenSizedBoxSpacerHeight,
              ),
              const HomeScreenLikeIcon(),
            ],
          ),
        ),
      ],
    );
  }
}
