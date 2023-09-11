import 'dart:convert';

import 'package:http/http.dart';

import '../../core/util/data_state.dart';
import '../../core/util/enum_classes.dart';
import '../../domain/repository/i_movie_repository.dart';
import '../datasource/remote/movie_api_provider.dart';
import '../model/genres_model.dart';
import '../model/movie_model.dart';

class MovieRepository extends IMovieRepository {
  final MovieApiProvider moviesApiProvider;
  static MovieRepository? _instance;

  MovieRepository({
    required this.moviesApiProvider,
  });

  @override
  Future<DataState<GenreModel>> fetchGenresFromAPI() async {
    DataState<dynamic> result = await moviesApiProvider.fetchMovieGenres();
    if (result.state == BaseState.success) {
      return DataSuccess<GenreModel>(
        GenreModel.fromJson(json.decode(result.data)['genres']),
      );
    } else {
      return DataFailed<GenreModel>(result.error!);
    }
  }

  @override
  Future<DataState<MovieModel>> fetchMoviesFromAPI(String category) async {
    DataState<dynamic> result =
        await moviesApiProvider.fetchMovieList(category);
    if (result.state == BaseState.success) {
      return DataSuccess<MovieModel>(
        MovieModel.fromJson(result.data),
      );
    } else {
      return DataFailed<MovieModel>(result.error!);
    }
  }

  factory MovieRepository.instance() {
    _instance ??= MovieRepository(
      moviesApiProvider: MovieApiProvider(
        client: Client(),
      ),
    );

    return _instance!;
  }
}
