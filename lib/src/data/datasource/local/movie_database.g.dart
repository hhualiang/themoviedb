// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMovieDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MovieDatabaseBuilder databaseBuilder(String name) =>
      _$MovieDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MovieDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MovieDatabaseBuilder(null);
}

class _$MovieDatabaseBuilder {
  _$MovieDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MovieDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MovieDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MovieDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MovieDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MovieDatabase extends MovieDatabase {
  _$MovieDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  MovieGenreDao? _movieGenreDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Movie` (`adult` INTEGER NOT NULL, `backdropPath` TEXT NOT NULL, `genreIds` TEXT NOT NULL, `id` INTEGER NOT NULL, `originalLanguage` TEXT NOT NULL, `originalTitle` TEXT NOT NULL, `overviewText` TEXT NOT NULL, `popularity` TEXT NOT NULL, `posterPath` TEXT NOT NULL, `releaseDate` TEXT NOT NULL, `title` TEXT NOT NULL, `hasVideo` INTEGER NOT NULL, `movieRating` TEXT NOT NULL, `voteCount` INTEGER NOT NULL, `category` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MovieGenre` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }

  @override
  MovieGenreDao get movieGenreDao {
    return _movieGenreDaoInstance ??= _$MovieGenreDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'Movie',
            (Movie item) => <String, Object?>{
                  'adult': item.adult ? 1 : 0,
                  'backdropPath': item.backdropPath,
                  'genreIds': _genresListConverter.encode(item.genreIds),
                  'id': item.id,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overviewText': item.overviewText,
                  'popularity': _popularityConverter.encode(item.popularity),
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'hasVideo': item.hasVideo ? 1 : 0,
                  'movieRating': _popularityConverter.encode(item.movieRating),
                  'voteCount': item.voteCount,
                  'category': _categoryListConverter.encode(item.category)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  @override
  Future<List<Movie>> getAllMovies(String cat) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Movie WHERE category LIKE \'%\' || ?1 || \'%\'',
        mapper: (Map<String, Object?> row) => Movie(
            adult: (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String,
            genreIds: _genresListConverter.decode(row['genreIds'] as String),
            id: row['id'] as int,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overviewText: row['overviewText'] as String,
            popularity:
                _popularityConverter.decode(row['popularity'] as String),
            posterPath: row['posterPath'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            hasVideo: (row['hasVideo'] as int) != 0,
            movieRating:
                _popularityConverter.decode(row['movieRating'] as String),
            voteCount: row['voteCount'] as int,
            category: _categoryListConverter.decode(row['category'] as String)),
        arguments: [cat]);
  }

  @override
  Future<Movie?> findMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM Movie WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Movie(
            adult: (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String,
            genreIds: _genresListConverter.decode(row['genreIds'] as String),
            id: row['id'] as int,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overviewText: row['overviewText'] as String,
            popularity:
                _popularityConverter.decode(row['popularity'] as String),
            posterPath: row['posterPath'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            hasVideo: (row['hasVideo'] as int) != 0,
            movieRating:
                _popularityConverter.decode(row['movieRating'] as String),
            voteCount: row['voteCount'] as int,
            category: _categoryListConverter.decode(row['category'] as String)),
        arguments: [id]);
  }

  @override
  Future<void> insertMovie(Movie movie) async {
    await _movieInsertionAdapter.insert(movie, OnConflictStrategy.replace);
  }
}

class _$MovieGenreDao extends MovieGenreDao {
  _$MovieGenreDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieGenreInsertionAdapter = InsertionAdapter(
            database,
            'MovieGenre',
            (MovieGenre item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieGenre> _movieGenreInsertionAdapter;

  @override
  Future<List<MovieGenre>> getAllGenres() async {
    return _queryAdapter.queryList('SELECT * From MovieGenre',
        mapper: (Map<String, Object?> row) =>
            MovieGenre(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<void> deleteGenre() async {
    await _queryAdapter.queryNoReturn('DELETE FROM MovieGenre');
  }

  @override
  Future<void> insertGenre(MovieGenre movieGenre) async {
    await _movieGenreInsertionAdapter.insert(
        movieGenre, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _genresListConverter = GenresListConverter();
final _popularityConverter = PopularityConverter();
final _categoryListConverter = CategoryListConverter();
