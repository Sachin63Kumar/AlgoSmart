import 'package:flutter/material.dart';

import '../../../models/sort_model.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({
    Key? key,
    required this.number,
    required this.index,
    required this.widgetSize,
    required this.containerWidth,
    // ignore: unnecessary_null_comparison
  })  : assert(number != null && index != null && widgetSize != null),
        assert(index >= 0 && widgetSize > 30),
        super(key: key);

  final SortModel number;
  final int index;
  final double widgetSize;
  final double containerWidth;

  Offset _getPosition(double width) {
    final horizontalFit = width ~/ widgetSize;
    final leftOver = width - (horizontalFit * widgetSize);
    final verticalIndex = index ~/ horizontalFit;
    final horizontalIndex = index % horizontalFit;
    return Offset((widgetSize * horizontalIndex) + leftOver / 2,
        widgetSize * verticalIndex);
  }

  @override
  Widget build(BuildContext context) {
    final offset = _getPosition(containerWidth);

    var _fontSize = 20.0;
    var _borderRadius = 5.0;
    var _borderWidth = 1.0;
    var _borderColor = Colors.black54;
    if (number.state == SortState.sort) {
      _fontSize = 32;
      _borderRadius = 40.0;
      _borderWidth = 2.0;
    } else if (number.state == SortState.sorted) {
      _fontSize = 20;
      _borderRadius = 5.0;
      _borderWidth = 1.0;
      _borderColor = Color.fromARGB(255, 124, 255, 129);
    }

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 2250),
      curve: Curves.elasticOut,
      left: offset.dx,
      top: offset.dy,
      child: SizedBox(
        width: widgetSize,
        height: widgetSize,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            decoration: BoxDecoration(
              border: Border.all(
                color: _borderColor,
                width: _borderWidth,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(_borderRadius),
              ),
            ),
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: _fontSize,
                ),
                child: Text(
                  number.value.toString(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
