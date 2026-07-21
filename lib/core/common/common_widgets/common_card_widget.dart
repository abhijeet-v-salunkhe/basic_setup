import 'package:flutter/material.dart';

class CommonCardWidget extends StatelessWidget {
  const CommonCardWidget({
    super.key,
    this.color,
    this.elevation,
    this.shape,
    this.margin,
    required this.child,
  });

  final Color? color;
  final double? elevation;
  final ShapeBorder? shape;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      color: color,
      elevation: elevation,
      shape: shape,
      child: child,
    );
  }
}
