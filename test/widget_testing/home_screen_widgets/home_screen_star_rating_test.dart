import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/home_screen/home_screen_star_rating.dart';

void main() {
  testWidgets(
      'Verify that HomeScreenMovieRating widgets displays the correct amount of full stars, half stars, and empty stars depending on rating',
      (WidgetTester tester) async {
    const num rating = 6.7;
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreenMovieRating(
        rating: rating,
      ),
    ),);

    expect(find.byIcon(Icons.star), findsNWidgets(3));
    expect(find.byIcon(Icons.star_half), findsOneWidget);
    expect(find.byIcon(Icons.star_border), findsOneWidget);
    expect(find.byKey(const Key('homeScreenMovieRating')), findsOneWidget);
  });
}
