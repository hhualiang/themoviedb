import '../../domain/entity/genre_state.dart';
import 'i_bloc.dart';

abstract class IMovieDetailsController extends IBloc {
  Stream<GenresState> get genresStream;

  void fetchGenres();
}
