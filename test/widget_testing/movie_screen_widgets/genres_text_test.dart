import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/movie_screen/movie_genres/genres_text.dart';

void main() {
  testWidgets(
      'Verify that genres text widget is displayed and rendered correctly',
      (WidgetTester tester) async {
    const String title = 'Genre';
    await tester.pumpWidget(
      const MaterialApp(
        home: GenresText(
          text: title,
        ),
      ),
    );
    expect(find.byKey(const Key('genresText')), findsOneWidget);
    expect(find.text(title), findsOneWidget);
  });
}
