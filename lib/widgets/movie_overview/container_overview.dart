import 'package:flutter/material.dart';

import '../../utils/ui_constants.dart';
import '../../utils/ui_text.dart';

class ContainerOverview extends StatelessWidget {
  const ContainerOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          UiConstants.overviewContainerWidthUsage,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: UiConstants.overviewContainerBoxDecorWidth,
        ),
      ),
      child: const Text(
        UiText.movieOverviewText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
