import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:themovietb/src/presentation/widget/movie_photos/large_photo.dart';

void main() {
  testWidgets('Verify that large photo renders correctly and displays a photo',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => tester
          .pumpWidget(const MaterialApp(home: LargePhoto(url: 'mockurl.url'))),
    );
    expect(find.byType(Image), findsOneWidget);
    expect(find.byKey(const Key('backdropPhoto')), findsOneWidget);
  });
}
