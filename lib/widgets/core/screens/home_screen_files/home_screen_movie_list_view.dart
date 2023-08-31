import 'package:flutter/material.dart';

import '../../../../repository/movie_data_class.dart';
import 'home_screen_movie_row.dart';

class MovieRowListView extends StatelessWidget {
  const MovieRowListView({
    super.key,
    required this.movieList,
  });

  final List<MovieFile> movieList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (
        BuildContext context,
        int position,
      ) {
        return HomeScreenMovieRow(
          movie: movieList[position],
        );
      },
    );
  }
}
