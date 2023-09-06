import 'package:flutter/material.dart';

import '../../../../../src/core/util/ui_constants.dart';

class ContainerOverview extends StatelessWidget {
  const ContainerOverview({
    super.key,
    required this.overviewText,
  });

  final String overviewText;

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
      child: Text(
        overviewText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
