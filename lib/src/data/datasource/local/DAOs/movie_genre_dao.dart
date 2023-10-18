import 'package:floor/floor.dart';

import '../../../../domain/entity/movie_genre.dart';

@dao
abstract class MovieGenreDao {
  @Query('SELECT * From MovieGenre')
  Future<List<MovieGenre>> getAllGenres();

  @Query('DELETE FROM MovieGenre')
  Future<void> deleteGenre();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGenre(MovieGenre movieGenre);
}
