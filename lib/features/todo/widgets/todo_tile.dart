import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/height_spacer.dart';
import 'package:task_planner_app/common/widgets/width_spacer.dart';

import '../../../common/widgets/app_style.dart';
import '../../../common/widgets/reusable_text.dart';

class TodoTile extends StatelessWidget {
  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final Widget? switcher;
  final void Function()? delete;

  const TodoTile({
    super.key,
    this.color,
    this.title,
    this.description,
    this.start,
    this.end,
    this.editWidget,
    this.switcher,
    this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConstant.kWidth,
            decoration: BoxDecoration(
              color: AppConstant.kGreyLight,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppConstant.kRadius,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            AppConstant.kRadius,
                          ),
                        ),
                        //TODO: ADD DYNAMIC COLORS
                        color: color ?? AppConstant.kRed,
                      ),
                    ),
                    const WidthSpacer(widthSpacing: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConstant.kWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: title ?? 'Title of Todo',
                              style: appStyle(
                                18,
                                AppConstant.kLight,
                                FontWeight.bold,
                              ),
                            ),
                            const HeightSpacer(heightSpacing: 3),
                            ReusableText(
                              text: description ?? 'Description of Todo',
                              style: appStyle(
                                12,
                                AppConstant.kLight,
                                FontWeight.bold,
                              ),
                            ),
                            const HeightSpacer(heightSpacing: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 25.h,
                                  width: AppConstant.kWidth * 0.3,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.3,
                                      color: AppConstant.kGreyDk,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        AppConstant.kRadius,
                                      ),
                                    ),
                                    color: AppConstant.kBkDark,
                                  ),
                                  child: Center(
                                    child: ReusableText(
                                        text: '$start | $end',
                                        style: appStyle(
                                          12,
                                          AppConstant.kLight,
                                          FontWeight.normal,
                                        )),
                                  ),
                                ),
                                const WidthSpacer(widthSpacing: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    const WidthSpacer(widthSpacing: 20),
                                    GestureDetector(
                                      onTap: delete,
                                      child: const Icon(
                                          MaterialCommunityIcons.delete_circle),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: switcher,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
