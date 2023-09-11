import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/movie_screen/movie_information/basic_information/rating.dart';

void main() {
  testWidgets('Verify that rating widget is displayed and rendered correctly',
      (WidgetTester tester) async {
    const double rating = 9.3;
    await tester.pumpWidget(
      MaterialApp(
        home: RatingDisplay(
          rating: rating.toString(),
        ),
      ),
    );
    expect(find.byKey(const Key('ratingDisplay')), findsOneWidget);
    expect(find.text(rating.toString()), findsOneWidget);
  });
}
