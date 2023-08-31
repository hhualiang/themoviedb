import 'package:flutter/material.dart';

import '../../../../repository/movie_data_class.dart';
import '../../../../utils/ui_constants.dart';
import '../movie_photos/small_photo_container.dart';
import 'home_screen_widgets.dart';

class HomeScreenMovieDetails extends StatelessWidget {
  const HomeScreenMovieDetails({
    super.key,
    required this.movie,
  });

  final MovieFile movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SmallPhotoContainer(
          url: movie.posterPath,
        ),
        Padding(
          padding: const EdgeInsets.all(
            UiConstants.homeScreenMovieRowInformationPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
