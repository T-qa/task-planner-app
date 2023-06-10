import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightSpacer extends StatelessWidget {
  final double heightSpacing;
  const HeightSpacer({
    super.key,
    required this.heightSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSpacing.h,
    );
  }
}
