import 'package:flutter/material.dart';

import '../../../../core/util/widget_keys.dart';

class ContainerOverview extends StatelessWidget {
  static const double containerWidthUsage = 0.9;
  static const double boxDecorWidth = 5;

  const ContainerOverview({
    super.key,
    required this.overviewText,
  });

  final String overviewText;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key(WidgetKey.overviewText),
      width: MediaQuery.of(context).size.width * containerWidthUsage,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: boxDecorWidth,
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
