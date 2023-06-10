// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onchanged;

  const CustomTextField({
    Key? key,
    this.keyboardType,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    this.hintStyle,
    this.onchanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstant.kWidth * 0.9,
      decoration: BoxDecoration(
        color: AppConstant.kLight,
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppConstant.kRadius,
          ),
        ),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        cursorHeight: 25,
        onChanged: onchanged,
        controller: controller,
        style: appStyle(
          18,
          AppConstant.kBkDark,
          FontWeight.w700,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconColor: AppConstant.kBkDark,
          hintStyle: hintStyle,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppConstant.kRed,
              width: 0.5,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.5,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppConstant.kRed,
              width: 0.5,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppConstant.kGreyDk,
              width: 0.5,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppConstant.kBkDark,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
