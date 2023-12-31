import 'dart:async';

import '../../core/bloc/i_movie_controller.dart';
import '../../core/util/data_state.dart';
import '../../core/util/enum_classes.dart';
import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_state.dart';
import '../../domain/usecase/usecase_impl/get_movies_usecase_impl.dart';

class MovieController extends IMovieController {
  final StreamController<MovieState> _moviesController =
      StreamController<MovieState>.broadcast();
  final GetMoviesUseCase getMoviesUseCase;

  MovieController({
    required this.getMoviesUseCase,
  });

  @override
  void dispose() {
    _moviesController.close();
  }

  @override
  void fetchMovieByCategory(String category) async {
    _moviesController.sink.add(
      MovieState.loading(),
    );
    DataState<List<Movie>> movieState =
        await getMoviesUseCase.getMovieList(category);
    if (movieState.state == BaseState.success) {
      _moviesController.sink.add(
        movieState.data != null
            ? MovieState.success(
                movieList: movieState.data!,
              )
            : MovieState.empty(),
      );
    } else {
      _moviesController.sink.add(
        MovieState.error(error: movieState.error!),
      );
    }
  }

  @override
  Future<void> initialize() async {
    fetchMovieByCategory('popular');
  }

  @override
  Stream<MovieState> get moviesStream => _moviesController.stream;
}
