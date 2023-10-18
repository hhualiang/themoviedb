import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/util/ui_string.dart';
import '../../../core/util/widget_keys.dart';

class SmallPhotoContainer extends StatelessWidget {
  static const double _containerWidth = 150;
  static const double _containerHeight = 220;
  static const double _containerBoxDecorWidth = 8;
  static const double _errorImageHeight = 120;
  static const double _errorImageWidth = 40;
  static const double _errorFontSize = 11;

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
        errorBuilder: (
          BuildContext context,
          Object object,
          StackTrace? stackTracer,
        ) =>
            const Column(
          children: <Widget>[
            SizedBox(
              width: _errorImageWidth,
              height: _errorImageHeight,
              child: Image(
                image: AssetImage(UiString.errorImagePath),
              ),
            ),
            Text(
              UiString.errorImageText,
              style: TextStyle(
                fontSize: _errorFontSize,
              ),
            )
          ],
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
