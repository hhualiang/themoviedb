import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/data/datasource/local/DAOs/movie_dao.dart';
import 'package:themovietb/src/data/datasource/local/DAOs/movie_genre_dao.dart';
import 'package:themovietb/src/data/datasource/local/movie_database.dart';
import 'package:themovietb/src/domain/entity/movie.dart';
import 'package:themovietb/src/domain/entity/movie_genre.dart';

void main() {
  group('database movie dao functions tests', () {
    late MovieDatabase testDatabase;
    late MovieDao movieDao;

    setUp(() async {
      testDatabase =
          await $FloorMovieDatabase.inMemoryDatabaseBuilder().build();
      movieDao = testDatabase.movieDao;
    });

    tearDown(() async {
      await testDatabase.close();
    });
    final movie = Movie(
      adult: false,
      backdropPath: '',
      genreIds: [20],
      id: 1,
      originalLanguage: 'English',
      originalTitle: 'title1',
      overviewText: 'overview',
      popularity: 200,
      posterPath: ' ',
      releaseDate: '01-01-2001',
      title: 'title1',
      hasVideo: false,
      movieRating: 10,
      voteCount: 200,
      category: ['top'],
    );
    final movie2 = Movie(
      adult: false,
      backdropPath: '',
      genreIds: [20],
      id: 2,
      originalLanguage: 'English',
      originalTitle: 'title2',
      overviewText: 'overview',
      popularity: 200,
      posterPath: ' ',
      releaseDate: '01-01-2001',
      title: 'title2',
      hasVideo: false,
      movieRating: 10,
      voteCount: 200,
      category: ['top'],
    );
    test('find movie by id', () async {
      await movieDao.insertMovie(movie);

      final actual = await movieDao.findMovieById(1);

      expect(actual, equals(movie));
    });

    test('get all movies', () async{
      await movieDao.insertMovie(movie);
      await movieDao.insertMovie(movie2);

      final actual = await movieDao.getAllMovies('top');

      expect(actual, isInstanceOf<List<Movie>>());
      expect(actual[0], equals(movie));
      expect(actual[1], equals(movie2));
    });
  });

  group('database movie dao functions tests', () {
    late MovieDatabase testDatabase;
    late MovieGenreDao genreDao;

    setUp(() async {
      testDatabase =
      await $FloorMovieDatabase.inMemoryDatabaseBuilder().build();
      genreDao = testDatabase.movieGenreDao;
    });

    tearDown(() async {
      await testDatabase.close();
    });
    final genre = MovieGenre(id: 1, name: 'Action');
    final genre2 = MovieGenre(id: 2, name: 'Adventure');


    test('get all movies', () async{
      await genreDao.insertGenre(genre);
      await genreDao.insertGenre(genre2);

      final actual = await genreDao.getAllGenres();

      expect(actual, isInstanceOf<List<MovieGenre>>());
      expect(actual[0], equals(genre));
      expect(actual[1], equals(genre2));
    });
  });
}
