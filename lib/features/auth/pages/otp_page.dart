import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/height_spacer.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeightSpacer(heightSpacing: AppConstant.kHeight * 0.12),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Image.asset(
                'assets/images/todo.png',
                width: AppConstant.kWidth * 0.5.w,
              ),
            ),
            const HeightSpacer(heightSpacing: 26),
            ReusableText(
              text: 'Enter OTP',
              style: appStyle(
                18,
                AppConstant.kLight,
                FontWeight.bold,
              ),
            ),
            const HeightSpacer(heightSpacing: 26),
            Pinput(
              length: 6,
              showCursor: true,
              onCompleted: (value) {
                if (value.length == 6) {}
              },
              onSubmitted: (value) {
                if (value.length == 6) {}
              },
            )
          ],
        ),
      )),
    );
  }
}
