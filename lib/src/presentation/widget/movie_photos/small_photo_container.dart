import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';

class SmallPhotoContainer extends StatelessWidget {
  static const double _containerWidth = 150;
  static const double _containerHeight = 220;
  static const double _containerBoxDecorWidth = 8;

  const SmallPhotoContainer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key(WidgetKey.posterPhoto),
      width: _containerWidth,
      height: _containerHeight,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
          width: _containerBoxDecorWidth,
        ),
      ),
      child: Image(
        image: CachedNetworkImageProvider(
          url,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
