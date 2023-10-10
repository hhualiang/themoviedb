import '../../domain/entity/genre_state.dart';
import 'i_bloc.dart';

abstract class IMovieGenreController extends IBloc {
  Stream<GenresState> get genresStream;

  void fetchGenres();
}
