import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/height_spacer.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';
import 'package:task_planner_app/common/widgets/width_spacer.dart';

class BottomTile extends StatelessWidget {
  final String text;
  final String text2;
  final Color? color;
  const BottomTile({
    super.key,
    required this.text,
    required this.text2,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstant.kWidth,
      height: AppConstant.kHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Consumer(builder: (context, ref, child) {
            return Container(
              height: 80,
              width: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppConstant.kRadius,
                  ),
                ),
                //TODO: ADD DYNAMIC COLORS
                color: AppConstant.kGreen,
              ),
            );
          }),
          const WidthSpacer(widthSpacing: 15),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                ReusableText(
                  text: text,
                  style: appStyle(
                    24,
                    AppConstant.kLight,
                    FontWeight.bold,
                  ),
                ),
                const HeightSpacer(heightSpacing: 10),
                ReusableText(
                  text: text2,
                  style: appStyle(
                    12,
                    AppConstant.kLight,
                    FontWeight.normal,
                  ),
                ),
                const HeightSpacer(heightSpacing: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
