import 'package:flutter/material.dart';

import '../../../../../core/util/widget_keys.dart';

class RatingDisplay extends StatelessWidget {
  static const double circleAvatarRadius = 30;
  static const double circleAvatarFontSize = 24;

  const RatingDisplay({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      key: const Key(WidgetKey.ratingDisplay),
      radius: circleAvatarRadius,
      backgroundColor: Colors.white70,
      child: Text(
        rating,
        style: const TextStyle(
          fontSize: circleAvatarFontSize,
          color: Colors.black,
        ),
      ),
    );
  }
}
