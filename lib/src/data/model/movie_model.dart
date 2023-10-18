import '../../domain/entity/movie.dart';

class MovieModel {
  MovieModel({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.result,
  });

  final int page;
  final int totalResults;
  final int totalPages;
  final List<Movie> result;

  factory MovieModel.fromJson(
    Map<String, dynamic> parsedJson,
    String category,
  ) {
    return MovieModel(
      page: parsedJson['page'],
      totalResults: parsedJson['total_results'],
      totalPages: parsedJson['total_pages'],
      result: (parsedJson['results'] as List<dynamic>)
          .map(
            (dynamic movie) =>
                Movie.fromJson(movie as Map<String, dynamic>, category),
          )
          .toList(),
    );
  }
}
