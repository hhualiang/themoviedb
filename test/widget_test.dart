import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(' ', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Placeholder(),
      ),
    );
  });
}
