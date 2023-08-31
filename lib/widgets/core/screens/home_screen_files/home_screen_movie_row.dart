import 'package:flutter/material.dart';

import '../../../../repository/movie_data_class.dart';
import '../../../../utils/ui_constants.dart';
import '../screen_movie_details.dart';
import 'home_screen_movie_details.dart';

class HomeScreenMovieRow extends StatelessWidget {
  const HomeScreenMovieRow({
    super.key,
    required this.movie,
  });

  final MovieFile movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UiConstants.homeScreenMovieRowPadding),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
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
