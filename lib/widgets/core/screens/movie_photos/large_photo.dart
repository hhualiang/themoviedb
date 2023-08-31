import 'package:flutter/material.dart';

import '../../../../../../utils/ui_constants.dart';

class LargePhoto extends StatelessWidget {
  const LargePhoto({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: UiConstants.photoContainerAspectRatio,
      child: Image(
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
