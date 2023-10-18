import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/entity/movie.dart';
import '../../../domain/entity/movie_genre.dart';
import 'DAOs/movie_dao.dart';
import 'DAOs/movie_genre_dao.dart';
import 'converters/category_list_converter.dart';
import 'converters/genres_list_converter.dart';
import 'converters/popularity_converter.dart';

part 'movie_database.g.dart';

@TypeConverters(<Type>[
  GenresListConverter,
  PopularityConverter,
  CategoryListConverter,
])
@Database(
  version: 1,
  entities: <Type>[
    Movie,
    MovieGenre,
  ],
)
abstract class MovieDatabase extends FloorDatabase {
  MovieDao get movieDao;

  MovieGenreDao get movieGenreDao;
}
