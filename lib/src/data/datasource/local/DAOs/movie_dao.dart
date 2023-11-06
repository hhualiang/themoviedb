import 'package:floor/floor.dart';

import '../../../../domain/entity/fav_movie.dart';
import '../../../../domain/entity/movie.dart';

@dao
abstract class MovieDao {
  @Query("SELECT * FROM Movie WHERE category LIKE '%' || :cat || '%'")
  Future<List<Movie>> getAllMovies(String cat);

  @Query('SELECT * FROM Movie WHERE id = :id')
  Future<Movie?> findMovieById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(Movie movie);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertFavouriteMovie(FavouriteMovies favouriteMovies);

  @Query('SELECT * FROM Movie JOIN FavouriteMovies using(id)')
  Future<List<Movie>> getFavMovies();

  @delete
  Future<void> deleteFavouriteMovie(FavouriteMovies favouriteMovies);

  @Query('SELECT * FROM FavouriteMovies where id = :id')
  Future<int?> selectFavById(int id);
}
