import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/movie_screen/movie_screen_movie_app_bar.dart';

void main() {
  testWidgets('Verify that the App bar renders correctly',
      (WidgetTester tester) async {
    const String title = 'Sample title';
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: MovieAppBar(
            movieTitle: title,
          ),
        ),
      ),
    );

    Finder appBar = find.byKey(const Key('movieDetailsAppBar'));

    Finder appBarSearchButton = find.byIcon(Icons.search);
    Finder appBarBackButton = find.byIcon(Icons.arrow_back);
    expect(appBar, findsOneWidget);
    expect(find.text(title), findsOneWidget);
    expect(appBarBackButton, findsOneWidget);
    expect(appBarSearchButton, findsOneWidget);
  });
}
