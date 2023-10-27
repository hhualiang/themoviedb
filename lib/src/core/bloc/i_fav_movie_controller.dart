import '../../domain/entity/fav_movie.dart';
import '../../domain/entity/movie_state.dart';
import 'i_bloc.dart';

abstract class IFavMovieController extends IBloc{
  void saveFavouriteMovie(FavouriteMovie favouriteMovie);

  void fetchFavouriteMovies();

  Stream<MovieState> get moviesStream;
}
