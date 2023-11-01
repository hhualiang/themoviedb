import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';
import '../../../domain/entity/movie.dart';
import '../movie_screen/favourite_button.dart';
import 'home_screen_movie.dart';

class MovieGridView extends StatelessWidget {
  static const int _crossAxisCount = 2;
  static const double _childAspectRation = 0.62;
  static const double _iconTopPosition = 0;
  static const double _iconRightPosition = 20;
  static const double _movieInfoTopPosition = 10;
  static const double _movieInfoLRPosition = 0;

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
                  return Stack(
                    children: <Widget>[
                      Positioned(
                        top: _movieInfoTopPosition,
                        right: _movieInfoLRPosition,
                        left: _movieInfoLRPosition,
                        child: Center(
                          child: HomeScreenMovieShowCase(
                            movie: movieList[position],
                          ),
                        ),
                      ),
                      Positioned(
                        top: _iconTopPosition,
                        right: _iconRightPosition,
                        child: FavouriteButton(
                          movieId: movieList[position].id,
                        ),
                      ),
                    ],
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
