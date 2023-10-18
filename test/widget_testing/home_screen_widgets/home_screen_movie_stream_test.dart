import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:themovietb/src/domain/entity/movie.dart';
import 'package:themovietb/src/domain/entity/movie_state.dart';
import 'package:themovietb/src/presentation/widget/home_screen/home_screen_movies_stream_builder.dart';

class MockMovieState extends Mock implements MovieState {}

void main() {
  late MovieState mockMovie;
  late StreamController<MovieState> stream;
  setUp(() {
    mockMovie = MockMovieState();
    stream = StreamController<MovieState>();
  });
  final movie = Movie(
    adult: false,
    backdropPath: 'sample.url',
    genreIds: [20],
    id: 1,
    originalLanguage: 'English',
    originalTitle: 'title',
    overviewText: 'overview',
    popularity: 200,
    posterPath: '',
    releaseDate: '01-01-2001',
    title: 'title',
    hasVideo: false,
    movieRating: 10,
    voteCount: 200,
    category: [],
  );

  testWidgets('Verify that the MovieStreamBuilder widget renders correctly',
      (WidgetTester tester) async {
    mockMovie = MovieState.success(movieList: [movie]);

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: MovieStreamBuilder(
            stream: stream.stream,
          ),
        ),
      ),
    );
    stream.sink.add(mockMovie);
    expect(find.byKey(const Key('homeScreenMovieStream')), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('homeScreenMovieGridView')), findsOneWidget);
  });
  testWidgets(
      'Verify that the MovieStreamBuilder widget renders loading correctly',
      (WidgetTester tester) async {
    mockMovie = MovieState.loading();
    stream.add(mockMovie);
    await tester.pumpWidget(
      MaterialApp(home: MovieStreamBuilder(stream: stream.stream)),
    );
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'Verify that the MovieStreamBuilder widget renders failure correctly',
      (WidgetTester tester) async {
    const String mockError = 'Error';
    mockMovie = MovieState.error(error: 'Error');
    stream.add(mockMovie);
    await tester.pumpWidget(
      MaterialApp(home: MovieStreamBuilder(stream: stream.stream)),
    );
    await tester.pump();
    expect(find.text(mockError), findsOneWidget);
  });
}
