import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/movie_screen/movie_overview/container_overview.dart';

void main() {
  testWidgets(
      'Verify that overview container widget is displayed and rendered correctly',
      (WidgetTester tester) async {
    const String text = 'Sample overview text';
    await tester.pumpWidget(
      const MaterialApp(
        home: ContainerOverview(
          overviewText: text,
        ),
      ),
    );
    expect(find.byKey(const Key('overviewText')), findsOneWidget);
    expect(find.text(text), findsOneWidget);
  });
}
