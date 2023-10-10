import 'package:flutter/material.dart';

import '../../../config/route/route_names.dart';
import '../../../core/util/widget_keys.dart';
import '../../../domain/entity/movie.dart';
import 'home_screen_movie_details.dart';

class HomeScreenMovieShowCase extends StatelessWidget {
  static const double _movieRowPadding = 5;

  const HomeScreenMovieShowCase({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key(WidgetKey.homeScreenMovie),
      padding: const EdgeInsets.all(
        _movieRowPadding,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteNames.movieDetails,
            arguments: movie,
          );
        },
        child: HomeScreenMovieDetails(
          movie: movie,
        ),
      ),
    );
  }
}
