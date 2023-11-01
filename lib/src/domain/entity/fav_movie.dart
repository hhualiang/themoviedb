import 'package:floor/floor.dart';

@Entity(tableName: 'FavouriteMovies')
class FavouriteMovies {
  @primaryKey
  final int id;

  FavouriteMovies({
    required this.id,
  });
}
