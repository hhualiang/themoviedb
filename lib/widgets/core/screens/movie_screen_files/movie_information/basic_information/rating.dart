import 'package:flutter/material.dart';

import '../../../../../../utils/ui_constants.dart';

class RatingDisplay extends StatelessWidget {
  const RatingDisplay({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: UiConstants.ratingCircleAvatarRadius,
      backgroundColor: Colors.white70,
      child: Text(
        rating,
        style: const TextStyle(
          fontSize: UiConstants.ratingCircleAvatarFontSize,
          color: Colors.black,
        ),
      ),
    );
  }
}
