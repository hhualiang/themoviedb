import '../../domain/entity/movie_state.dart';
import 'i_bloc.dart';

abstract class IMovieController extends IBloc {
  Stream<MovieState> get moviesStream;

  void fetchMovieByCategory(String category);
}
