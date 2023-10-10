import 'package:flutter/material.dart';

import '../../../../src/core/util/ui_constants.dart';
import '../../../core/util/widget_keys.dart';

class ContainerCounter extends StatelessWidget {
  static const double _containerHeightWidth = 40;
  static const double _containerBorderRadiusC = 20;


  const ContainerCounter({
    super.key,
    required int counter,
  }) : _counter = counter;

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key(WidgetKey.movieDetailsCounter),
      height: _containerHeightWidth,
      width: _containerHeightWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_containerBorderRadiusC),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Center(
        child: Text(
          '$_counter',
          style: const TextStyle(
            color: Colors.white,
            fontSize: UiConstants.normalFontSize,
          ),
        ),
      ),
    );
  }
}
