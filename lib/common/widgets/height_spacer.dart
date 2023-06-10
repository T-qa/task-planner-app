import 'package:flutter/material.dart';

class HeightSpacer extends StatelessWidget {
  final double heightSpacing;
  const HeightSpacer({
    super.key,
    required this.heightSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSpacing,
    );
  }
}
