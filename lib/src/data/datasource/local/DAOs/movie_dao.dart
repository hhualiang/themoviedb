import 'package:floor/floor.dart';

import '../../../../domain/entity/movie.dart';

@dao
abstract class MovieDao {
  @Query("SELECT * FROM Movie WHERE category LIKE '%' || :cat || '%'")
  Future<List<Movie>> getAllMovies(String cat);

  @Query('SELECT * FROM Movie WHERE id = :id')
  Future<Movie?> findMovieById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(Movie movie);
}
