import 'dart:convert';

import 'package:flutter/services.dart';

import 'movie_data_class.dart';
import 'movie_genres_data_class.dart';
import 'movie_repository.dart';

class LocalRepository extends MovieRepository {
  static const String movieListPath = 'lib/assets/mocked_data/movies.json';
  static const String movieGenresPath = 'lib/assets/mocked_data/genres.json';

  @override
  Future<List<MovieGenres>> getGenres() async {
    final String response = await rootBundle.loadString(movieGenresPath);
    final genresJson = await json.decode(response)['genres'];
    return List.from(
      genresJson.map((genre) => MovieGenres.fromJson(genre)),
    );
  }

  @override
  Future<List<MovieFile>> getMovies() async {
    final String response = await rootBundle.loadString(movieListPath);
    final movieJson = await json.decode(response);
    return List.from(
      movieJson.map((movie) => MovieFile.fromJson(movie)),
    );
  }

  @override
  Future<List<String>> getGenresByIds(List<int> ids) async {
    List<MovieGenres> genresList = await getGenres();
    List<String> genres = genresList
        .where((genres) => ids.contains(genres.id))
        .map((genre) => genre.name)
        .toList();

    return genres;
  }
}
