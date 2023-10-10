import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';
import '../../../domain/entity/movie.dart';
import 'home_screen_movie.dart';

class MovieGridView extends StatelessWidget {
  static const int _crossAxisCount = 2;
  static const double _childAspectRation = 0.62;

  const MovieGridView({
    super.key,
    required this.movieList,
  });

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(WidgetKey.homeScreenMovieGridView),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: movieList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _crossAxisCount,
                  childAspectRatio: _childAspectRation,
                ),
                itemBuilder: (
                  BuildContext context,
                  int position,
                ) {
                  return Center(
                    child: HomeScreenMovieShowCase(
                      movie: movieList[position],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
