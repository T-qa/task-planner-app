import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/height_spacer.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';
import 'package:task_planner_app/features/auth/controllers/auth_controller.dart';

class OTPScreen extends ConsumerWidget {
  const OTPScreen({
    super.key,
    required this.smsCodeId,
    required this.phone,
  });
  final String smsCodeId;
  final String phone;

  void verifyOTPCode(BuildContext context, WidgetRef ref, String smsCode) {
    ref.read(authControllerProvider).verifyOTPCode(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                if (value.length == 6) {
                  return verifyOTPCode(context, ref, value);
                }
              },
              onSubmitted: (value) {
                if (value.length == 6) {
                  return verifyOTPCode(context, ref, value);
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
