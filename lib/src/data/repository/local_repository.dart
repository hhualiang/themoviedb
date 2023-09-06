import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_genre.dart';
import '../../domain/repository/i_movie_repository.dart';

class LocalRepository extends IMovieRepository {
  static const String movieListPath = 'lib/assets/mocked_data/movies.json';
  static const String movieGenresPath = 'lib/assets/mocked_data/genres.json';

  @override
  Future<List<MovieGenre>> getGenres() async {
    final String response = await rootBundle.loadString(movieGenresPath);
    final dynamic genresJson = await json.decode(response)['genres'];
    return List<MovieGenre>.from(
      genresJson.map((dynamic genre) => MovieGenre.fromJson(genre)),
    );
  }

  @override
  Future<List<Movie>> getMovies() async {
    final String response = await rootBundle.loadString(movieListPath);
    final dynamic movieJson = await json.decode(response);
    return List<Movie>.from(
      movieJson.map((dynamic movie) => Movie.fromJson(movie)),
    );
  }

  @override
  Future<List<String>> getGenresByIds(List<int> ids) async {
    List<MovieGenre> genresList = await getGenres();
    List<String> genres = genresList
        .where((MovieGenre genres) => ids.contains(genres.id))
        .map((MovieGenre genre) => genre.name)
        .toList();

    return genres;
  }
}
