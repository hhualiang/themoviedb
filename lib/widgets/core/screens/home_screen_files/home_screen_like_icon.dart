import 'package:flutter/material.dart';

import '../../../../utils/ui_constants.dart';

class HomeScreenLikeIcon extends StatelessWidget {
  const HomeScreenLikeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: UiConstants.homeScreenContainerWidth,
      child: const Icon(
        Icons.favorite_border,
        size: UiConstants.homeScreenFavoriteIconSize,
        color: Colors.red,
      ),
    );
  }
}
