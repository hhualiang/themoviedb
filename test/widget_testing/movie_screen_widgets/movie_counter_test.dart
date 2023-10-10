import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/movie_screen/movie_screen_like_counter.dart';

void main() {
  testWidgets('Verify that the counter shows the right value',
      (WidgetTester tester) async {
    const int counter = 345;
    await tester.pumpWidget(
        const MaterialApp(home: ContainerCounter(counter: counter),),);

    expect(find.byKey(const Key('movieDetailsCounter')), findsOneWidget);
    expect(find.text(counter.toString()), findsOneWidget);
  });
}
