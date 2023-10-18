import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';

class LargePhoto extends StatelessWidget {
  static const double _aspectRatio = 16 / 9;
  static const double _errorImageHeight = 100;
  static const double _errorImageWidth = 70;
  static const String _errorImagePath = 'lib/assets/no_image_found.png';
  static const String _errorImageText = 'Could not load image...';

  const LargePhoto({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _aspectRatio,
      child: Image(
        key: const Key(WidgetKey.backdropPhoto),
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
                image: AssetImage(_errorImagePath),
              ),
            ),
            Text(_errorImageText)
          ],
        ),
        image: NetworkImage(
          url,
        ),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? loadingProgress,
        ) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
