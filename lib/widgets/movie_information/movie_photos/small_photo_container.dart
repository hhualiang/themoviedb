import 'package:flutter/material.dart';

import '/widgets/custom_widgets.dart';

class SmallPhotoContainer extends StatelessWidget {
  const SmallPhotoContainer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UiConstants.photoContainerWidth,
      height: UiConstants.photoContainerHeight,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
          width: UiConstants.photoContainerBoxDecorWidth,
        ),
      ),
      child: Image(
        image: NetworkImage(
          url,
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
