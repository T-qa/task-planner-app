import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_planner_app/common/widgets/custom_button.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/height_spacer.dart';
import '../../auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstant.kHeight,
      width: AppConstant.kWidth,
      color: AppConstant.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Image.asset("assets/images/todo.png"),
          ),
          const HeightSpacer(heightSpacing: 50),
          CustomButton(
            width: AppConstant.kWidth * 0.9,
            height: AppConstant.kHeight * 0.9,
            color: AppConstant.kLight,
            text: 'Login with phone number',
            ontap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
