import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:themovietb/src/domain/entity/movie.dart';
import 'package:themovietb/src/presentation/widget/home_screen/home_screen_movie_grid_view.dart';

void main() {
  final List<Movie> mockMovieList = [
    Movie(
      adult: false,
      backdropPath: '',
      genreIds: [20],
      id: 1,
      originalLanguage: 'English',
      originalTitle: 'title',
      overviewText: 'overview',
      popularity: 200,
      posterPath: ' ',
      releaseDate: '01-01-2001',
      title: 'title',
      hasVideo: false,
      movieRating: 10,
      voteCount: 200,
    ),
    Movie(
      adult: false,
      backdropPath: '',
      genreIds: [20],
      id: 2,
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
    ),
  ];

  testWidgets(
      'Verify that HomeScreenGridView widget renders correctly and displays the right information such photo and movie title',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: MovieGridView(
            movieList: mockMovieList,
          ),
        ),
      ),
    );
    expect(find.byKey(const Key('homeScreenMovieGridView')), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(2));
    expect(find.byKey(const Key('homeScreenMovie')), findsNWidgets(2));
    expect(find.text('title'), findsOneWidget);
    expect(find.byKey(const Key('homeScreenMovieTitle')), findsNWidgets(2));
    expect(find.byKey(const Key('homeScreenMovieRating')), findsNWidgets(2));
    expect(find.byType(InkWell), findsNWidgets(2));
  });
}
