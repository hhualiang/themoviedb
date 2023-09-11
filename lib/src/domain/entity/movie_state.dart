import '../../core/util/enum_classes.dart';
import 'movie.dart';

class MovieState {
  final BaseState state;
  final List<Movie>? movieList;
  final String? error;

  const MovieState({
    required this.state,
    this.movieList,
    this.error,
  });

  @override
  bool operator ==(Object other) =>
      other is MovieState &&
      runtimeType == other.runtimeType &&
      state == other.state;

  @override
  int get hashCode => state.hashCode;

  factory MovieState.success({required List<Movie> movieList}) => MovieState(
        state: BaseState.success,
        movieList: movieList,
      );

  factory MovieState.empty() => const MovieState(
        state: BaseState.empty,
      );

  factory MovieState.loading() => const MovieState(
        state: BaseState.loading,
      );

  factory MovieState.error({required String error}) => MovieState(
        state: BaseState.failure,
        error: error,
      );
}
