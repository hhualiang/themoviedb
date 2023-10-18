import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:themovietb/src/domain/entity/movie.dart';
import 'package:themovietb/src/presentation/widget/home_screen/home_screen_movie.dart';

void main() {
  final mockMovie = Movie(
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
    category: [],
  );
  testWidgets('Verify that HomeScreenMovie widgets renders correctly', (
    WidgetTester tester,
  ) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeScreenMovieShowCase(
              movie: mockMovie,
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('homeScreenMovie')), findsOneWidget);
    expect(find.byKey(const Key('homeScreenMovieDetails')), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
  });
}
