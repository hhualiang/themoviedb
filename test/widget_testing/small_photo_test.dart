import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:themovietb/src/presentation/widget/movie_photos/small_photo_container.dart';

void main() {
  testWidgets(
      'Verify that SmallPhotoContainer renders correctly and displays a photo',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        const MaterialApp(
          home: SmallPhotoContainer(url: 'mockurl.url'),
        ),
      ),
    );
    expect(find.byType(Image), findsOneWidget);
    expect(find.byKey(const Key('posterPhoto')), findsOneWidget);
  });
}
