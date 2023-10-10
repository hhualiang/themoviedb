import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/movie_screen/movie_information/basic_information/movie_title.dart';

void main() {
  testWidgets(
      'Verify that movie title widget is displayed and rendered correctly',
      (WidgetTester tester) async {
    const String title = 'Sample Text';
    await tester.pumpWidget(
      const MaterialApp(
        home: MovieTitle(
          title: title,
        ),
      ),
    );
    expect(find.byKey(const Key('movieDetailsMovieTitle')), findsOneWidget);
    expect(find.text(title), findsOneWidget);
  });
}
