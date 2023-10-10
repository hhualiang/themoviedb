import 'package:flutter/material.dart';

import '../../../../src/core/util/ui_constants.dart';
import '../../../core/util/widget_keys.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: const Key(WidgetKey.titleTextStyle),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: UiConstants.normalFontSize,
      ),
    );
  }
}
