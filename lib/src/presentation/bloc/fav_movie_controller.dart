import 'dart:async';

import '../../core/bloc/i_fav_movie_controller.dart';
import '../../core/util/data_state.dart';
import '../../core/util/enum_classes.dart';
import '../../domain/entity/fav_movie.dart';
import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_state.dart';
import '../../domain/usecase/usecase_impl/delete_fav_movie_usecase_impl.dart';
import '../../domain/usecase/usecase_impl/get_fav_movie_by_id_impl.dart';
import '../../domain/usecase/usecase_impl/get_fav_movie_usecase_impl.dart';
import '../../domain/usecase/usecase_impl/save_fav_movie_usecase_impl.dart';

class FavouriteMovieController extends IFavMovieController {
  final StreamController<MovieState> _favMoviesController =
      StreamController<MovieState>.broadcast();

  final GetFavMovieUseCase getFavMovieUseCase;
  final SaveFavMovieUseCase saveFavMovieUseCase;
  final DeleteFavMovieUseCase deleteFavMovieUseCase;
  final GetFavMovieByIdUseCase getFavMovieByIdUseCase;

  FavouriteMovieController({
    required this.getFavMovieUseCase,
    required this.saveFavMovieUseCase,
    required this.deleteFavMovieUseCase,
    required this.getFavMovieByIdUseCase,
  });

  @override
  void dispose() {
    _favMoviesController.close();
  }

  @override
  void fetchFavouriteMovies() async {
    _favMoviesController.sink.add(
      MovieState.loading(),
    );
    DataState<List<Movie>> movieState = await getFavMovieUseCase.getFavMovie();
    if (movieState.state == BaseState.success) {
      _favMoviesController.sink.add(
        MovieState.success(movieList: movieState.data!),
      );
    } else {
      _favMoviesController.sink.add(
        MovieState.error(error: movieState.error!),
      );
    }
  }

  @override
  Future<void> initialize() async {
    fetchFavouriteMovies();
  }

  @override
  Stream<MovieState> get moviesStream => _favMoviesController.stream;

  @override
  Future<void> saveFavouriteMovie(FavouriteMovies favouriteMovie) async {
    saveFavMovieUseCase.saveFavMovie(favouriteMovie);
  }

  @override
  Future<void> deleteFavouriteMovie(FavouriteMovies favouriteMovies) async {
    deleteFavMovieUseCase.deleteFavouriteMovie(favouriteMovies);
  }

  @override
  Future<bool> existFavourite(int id) async {
    final int exist = await getFavMovieByIdUseCase.getFavMovieById(id);
    if (exist == -1) {
      return false;
    } else {
      return true;
    }
  }
}
