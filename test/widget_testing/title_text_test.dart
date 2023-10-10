import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/movie_screen/movie_screen_title_text_style.dart';

void main() {
  testWidgets(
      'Verify that the string passed to the title text is showed correctly',
      (WidgetTester tester) async {
    const String text = 'Test text';
    await tester.pumpWidget(
      const MaterialApp(
        home: TitleText(
          text: text,
        ),
      ),
    );

    var finalText = find.byKey(const Key('titleTextStyle'));

    expect(finalText, findsOneWidget);
  });
}
