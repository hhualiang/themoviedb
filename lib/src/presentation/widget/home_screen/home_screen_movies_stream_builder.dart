import 'package:flutter/material.dart';

import '../../../core/util/enum_classes.dart';
import '../../../core/util/widget_keys.dart';
import '../../../domain/entity/movie_state.dart';
import 'home_screen_movie_grid_view.dart';

class MovieStreamBuilder extends StatelessWidget {
  const MovieStreamBuilder({
    super.key,
    required this.stream,
  });

  final Stream<MovieState> stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieState>(
      key: const Key(WidgetKey.homeScreenMovieStream),
      stream: stream,
      builder: (
        BuildContext context,
        AsyncSnapshot<MovieState> snapshot,
      ) {
        switch (snapshot.data?.state) {
          case BaseState.success:
            return MovieGridView(movieList: snapshot.data!.movieList!);
          case BaseState.empty:
            return const SizedBox.shrink();
          case BaseState.failure:
            return Center(
              child: Text(snapshot.data!.error!),
            );
          case BaseState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
