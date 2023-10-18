import 'package:floor/floor.dart';

@entity
class MovieGenre {
  @primaryKey
  final int id;
  final String name;

  MovieGenre({
    required this.id,
    required this.name,
  });

  factory MovieGenre.fromJson(Map<String, dynamic> json) {
    return MovieGenre(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieGenre &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
