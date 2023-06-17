import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  String? buttonText,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: ReusableText(
          text: message,
          style: appStyle(18, AppConstant.kLight, FontWeight.w600),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.h),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              buttonText ?? 'Ok',
              style: appStyle(18, AppConstant.kGreyLight, FontWeight.w600),
            ),
          )
        ],
      );
    },
  );
}
