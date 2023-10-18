import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/movie_screen/movie_information/basic_information/release_date.dart';

void main() {
  testWidgets('Verify that the release date is displayed correctly',
      (WidgetTester tester) async {
    const String releaseDate = '01-01-2001';
    await tester.pumpWidget(
      const MaterialApp(
        home: ReleaseDate(
          releaseDate: releaseDate,
        ),
      ),
    );

    expect(find.text(releaseDate), findsOneWidget);
    expect(find.byKey(const Key('movieDetailsReleaseDate')), findsOneWidget);
  });
}
