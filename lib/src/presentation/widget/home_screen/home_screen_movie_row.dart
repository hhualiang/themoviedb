import 'package:flutter/material.dart';

import '../../../domain/entity/movie.dart';
import '../../../../src/core/util/ui_constants.dart';
import '../../../../src/presentation/view/movie_details_view.dart';
import 'home_screen_movie_details.dart';

class HomeScreenMovieRow extends StatelessWidget {
  const HomeScreenMovieRow({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UiConstants.homeScreenMovieRowPadding),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ScreenMovieDetails(
                movie: movie,
              ),
            ),
          );
        },
        child: HomeScreenMovieDetails(
          movie: movie,
        ),
      ),
    );
  }
}
