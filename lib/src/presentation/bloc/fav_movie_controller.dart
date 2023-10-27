import 'dart:async';

import '../../core/bloc/i_fav_movie_controller.dart';
import '../../domain/entity/fav_movie.dart';
import '../../domain/entity/movie_state.dart';

class FavouriteMovieController extends IFavMovieController {

  final StreamController<MovieState> _moviesController =
  StreamController<MovieState>.broadcast();


  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void fetchFavouriteMovies() {
    // TODO: implement fetchFavouriteMovies
  }

  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  // TODO: implement moviesStream
  Stream<MovieState> get moviesStream => throw UnimplementedError();

  @override
  void saveFavouriteMovie(FavouriteMovie favouriteMovie) {
    // TODO: implement saveFavouriteMovie
  }

}
