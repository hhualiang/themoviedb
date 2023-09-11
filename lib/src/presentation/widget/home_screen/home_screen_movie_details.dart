import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';
import '../../../domain/entity/movie.dart';
import '../movie_photos/small_photo_container.dart';
import 'home_screen_movie_title.dart';
import 'home_screen_star_rating.dart';

class HomeScreenMovieDetails extends StatelessWidget {
  const HomeScreenMovieDetails({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key(WidgetKey.homeScreenMovieDetails),
      children: <Widget>[
        SmallPhotoContainer(
          url: movie.posterPath,
        ),
        HomeScreenMovieTitle(
          title: movie.title,
        ),
        HomeScreenMovieRating(
          rating: movie.movieRating,
        ),
      ],
    );
  }
}
