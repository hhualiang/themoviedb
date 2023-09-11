import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/home_screen/home_screen_movie_title.dart';

void main() {
  testWidgets(
      'Verify that the widget HomeScreenMovieTitle displays the movie title correcty',
      (WidgetTester tester) async {
    const String title = 'title';
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreenMovieTitle(
          title: title,
        ),
      ),
    );

    expect(find.text(title), findsOneWidget);
    expect(find.byKey(const Key('homeScreenMovieTitle')), findsOneWidget);
  });
}
