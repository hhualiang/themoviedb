import 'package:floor/floor.dart';

@Entity(tableName: 'FavouriteMovies')
class FavouriteMovie {

  final int movieID;

  FavouriteMovie( this.movieID);
}
