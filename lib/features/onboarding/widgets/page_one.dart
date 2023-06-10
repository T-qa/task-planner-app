import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/height_spacer.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

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
          const HeightSpacer(heightSpacing: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                  text: "Todo",
                  style: appStyle(
                    30,
                    AppConstant.kLight,
                    FontWeight.w600,
                  )),
              const HeightSpacer(heightSpacing: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  'Welcome!!',
                  style: appStyle(
                    16,
                    AppConstant.kLight,
                    FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
