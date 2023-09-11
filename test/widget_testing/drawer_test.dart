import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovietb/src/presentation/widget/drawer/app_drawer.dart';

void main() {
  testWidgets('drawer widget test ', (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(),
          drawer: const AppDrawer(),
        ),
      ),
    );
    scaffoldKey.currentState!.openDrawer();
    await tester.pumpAndSettle();
    final drawer = find.byType((Drawer));
    await tester.tap(drawer);
    expect(drawer, findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('About the app'), findsOneWidget);
  });
}
