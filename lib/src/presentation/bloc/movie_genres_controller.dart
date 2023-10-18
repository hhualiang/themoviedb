import 'dart:async';

import '../../core/bloc/i_movie_genres_controller.dart';
import '../../core/util/data_state.dart';
import '../../core/util/enum_classes.dart';
import '../../domain/entity/genre_state.dart';
import '../../domain/entity/movie_genre.dart';
import '../../domain/usecase/usecase_impl/get_genres_usecase_impl.dart';

class MovieGenresController extends IMovieGenreController {
  final StreamController<GenresState> _genresController =
      StreamController<GenresState>.broadcast();
  final GetGenresUseCase getGenresUseCase;

  MovieGenresController({required this.getGenresUseCase});

  @override
  void dispose() {
    _genresController.close();
  }

  @override
  Future<void> fetchGenres() async {
    _genresController.sink.add(
      GenresState.loading(),
    );
    DataState<List<MovieGenre>> genresState =
        await getGenresUseCase.getGenreList();
    if (genresState.state == BaseState.success) {
      _genresController.sink.add(
        genresState.data != null
            ? GenresState.success(
                genreList: genresState.data!,
              )
            : GenresState.empty(),
      );
    } else {
      _genresController.sink.add(
        GenresState.error(error: genresState.error!),
      );
    }
  }

  @override
  Stream<GenresState> get genresStream => _genresController.stream;

  @override
  Future<void> initialize() async {
    fetchGenres();
  }
}
