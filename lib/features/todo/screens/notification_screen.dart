import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/height_spacer.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';
import 'package:task_planner_app/common/widgets/width_spacer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key, this.payload});
  final String? payload;

  @override
  Widget build(BuildContext context) {
    var title = payload!.split('|')[0];
    var descripton = payload!.split('|')[1];
    var begin = payload!.split('|')[3];
    var finish = payload!.split('|')[4];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              child: Container(
                width: AppConstant.kWidth,
                height: AppConstant.kHeight * 0.7,
                decoration: BoxDecoration(
                  color: AppConstant.kBkLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConstant.kRadius),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    children: [
                      ReusableText(
                        text: 'Reminder',
                        style: appStyle(
                          40,
                          AppConstant.kLight,
                          FontWeight.bold,
                        ),
                      ),
                      const HeightSpacer(heightSpacing: 5),
                      Container(
                        width: AppConstant.kWidth,
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: AppConstant.kYellow,
                          borderRadius: BorderRadius.all(
                            Radius.circular(9.h),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: 'Today',
                              style: appStyle(
                                14,
                                AppConstant.kBkDark,
                                FontWeight.bold,
                              ),
                            ),
                            const WidthSpacer(widthSpacing: 15),
                            ReusableText(
                              text: 'From : $begin to : $finish',
                              style: appStyle(
                                15,
                                AppConstant.kBkDark,
                                FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const HeightSpacer(heightSpacing: 10),
                      ReusableText(
                        text: title,
                        style: appStyle(
                          30,
                          AppConstant.kBkDark,
                          FontWeight.bold,
                        ),
                      ),
                      const HeightSpacer(heightSpacing: 10),
                      Text(
                        descripton,
                        maxLines: 8,
                        textAlign: TextAlign.justify,
                        style: appStyle(
                          16,
                          AppConstant.kLight,
                          FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 12.w,
              top: -10,
              child: Image.asset(
                'assets/images/bell.png',
                width: 70.w,
                height: 70.h,
              ),
            ),
            Positioned(
              bottom: AppConstant.kHeight * 0.143,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/notification.png',
                width: AppConstant.kWidth * 0.8,
                height: AppConstant.kHeight * 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
