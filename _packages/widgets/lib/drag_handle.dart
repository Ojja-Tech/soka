import 'package:flutter/material.dart';

/// [Widget] for [BottomSheet] to indicate it can be dismissed by dragging
class DragHandle extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? height;
  const DragHandle({
    Key? key,
    this.color,
    this.width = 60,
    this.height = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: color ?? Colors.grey[200],
        shape: const StadiumBorder(),
      ),
    );
  }
}
