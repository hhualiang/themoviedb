import '../../domain/entity/movie_genre.dart';

class GenreModel {
  GenreModel({
    required this.result,
  });

  final List<MovieGenre> result;

  factory GenreModel.fromJson(List<dynamic> parsedJson) {
    return GenreModel(
      result: parsedJson
          .map((dynamic movieGenre) => MovieGenre.fromJson(movieGenre))
          .toList(),
    );
  }
}
