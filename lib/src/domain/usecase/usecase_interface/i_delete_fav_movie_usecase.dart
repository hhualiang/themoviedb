import '../../entity/fav_movie.dart';

abstract class IDeleteFavMovieUseCase {
  Future<void> deleteFavouriteMovie(FavouriteMovies favouriteMovies);
}
