import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';

class LargePhoto extends StatelessWidget {
  static const double _aspectRatio = 16 / 9;

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
