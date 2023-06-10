import 'package:flutter/material.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      this.subColor,
      required this.text,
      this.ontap});
  final double width;
  final double height;
  final Color color;
  final Color? subColor;
  final String text;
  final Function? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: subColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(
            width: 1,
            color: color,
          ),
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appStyle(
              18,
              color,
              FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
