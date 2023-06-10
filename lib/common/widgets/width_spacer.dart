import 'package:flutter/material.dart';

class WidthSpacer extends StatelessWidget {
  final double widthSpacing;
  const WidthSpacer({
    super.key,
    required this.widthSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSpacing,
    );
  }
}
