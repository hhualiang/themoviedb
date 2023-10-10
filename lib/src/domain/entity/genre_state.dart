import '../../core/util/enum_classes.dart';
import 'movie_genre.dart';

class GenresState {
  final BaseState state;
  final List<MovieGenre>? genreList;
  final String? error;

  const GenresState({
    required this.state,
    this.genreList,
    this.error,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenresState &&
          runtimeType == other.runtimeType &&
          state == other.state;

  @override
  int get hashCode => state.hashCode;

  factory GenresState.success({required List<MovieGenre> genreList}) =>
      GenresState(
        state: BaseState.success,
        genreList: genreList,
      );

  factory GenresState.empty() => const GenresState(
        state: BaseState.empty,
      );

  factory GenresState.loading() => const GenresState(
        state: BaseState.loading,
      );

  factory GenresState.error({required String error}) => GenresState(
        state: BaseState.failure,
        error: error,
      );
}
