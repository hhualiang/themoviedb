import 'package:flutter/material.dart';

import '../../utils/ui_constants.dart';

class ContainerCounter extends StatelessWidget {
  const ContainerCounter({
    super.key,
    required int counter,
  }) : _counter = counter;

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UiConstants.likeButtonContainerHeightWidth,
      width: UiConstants.likeButtonContainerHeightWidth,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(UiConstants.likeButtonContainerBorderRadiusC),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Center(
        child: Text(
          '$_counter',
          style: const TextStyle(
            color: Colors.white,
            fontSize: UiConstants.likeButtonContainerFontSize,
          ),
        ),
      ),
    );
  }
}
