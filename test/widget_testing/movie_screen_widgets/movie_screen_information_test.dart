import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:themovietb/src/domain/entity/movie.dart';
import 'package:themovietb/src/presentation/widget/movie_screen/movie_screen_information.dart';

class MockMovie extends Mock implements Movie {}

void main() {
  late Movie movie;
  setUp(() {
    movie = MockMovie();
  });
  testWidgets(
      'MovieBasicInfoDisplay widget should display the right movie information',
      (WidgetTester tester) async {
    when(() => movie.title).thenReturn('title');
    when(() => movie.releaseDate).thenReturn('releaseDate');
    when(() => movie.movieRating).thenReturn(7.5);
    when(() => movie.posterPath).thenReturn('');
    when(() => movie.backdropPath).thenReturn('');

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: SingleChildScrollView(
            child: Column(
              children: [
                MovieBasicInfoDisplay(
                  movie: movie,
                )
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('movieBasicInfoDisplay')), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
    expect(find.text('releaseDate'), findsOneWidget);
    expect(find.text('7.5'), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(2));
  });
}
