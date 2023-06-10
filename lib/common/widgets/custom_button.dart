import 'package:flutter/material.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.width,
      required this.height,
      required this.textButtonColor,
      this.buttonColor,
      required this.text,
      this.ontap});
  final double width;
  final double height;
  final Color textButtonColor;
  final Color? buttonColor;
  final String text;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(
            width: 1,
            color: textButtonColor,
          ),
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appStyle(
              18,
              textButtonColor,
              FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
