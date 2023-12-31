import 'package:floor/floor.dart';

import '../../core/util/ui_string.dart';

@entity
class Movie {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  @primaryKey
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overviewText;
  final num popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool hasVideo;
  final num movieRating;
  final int voteCount;
  final List<String> category;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overviewText,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.hasVideo,
    required this.movieRating,
    required this.voteCount,
    required this.category,
  });

  factory Movie.fromJson(
    Map<String, dynamic> json,
    String category,
  ) {
    return Movie(
      adult: json['adult'] as bool,
      backdropPath: '${UiString.movieURL}${json['backdrop_path']}',
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overviewText: json['overview'] as String,
      popularity: json['popularity'] as num,
      posterPath: '${UiString.movieURL}${json['poster_path']}',
      releaseDate: json['release_date'] as String,
      title: json['title'] as String,
      hasVideo: json['video'] as bool,
      movieRating: json['vote_average'] as num,
      voteCount: json['vote_count'] as int,
      category: <String>[category],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
