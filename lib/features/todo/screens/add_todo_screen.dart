import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/custom_button.dart';
import 'package:task_planner_app/common/widgets/custom_text_field.dart';
import 'package:task_planner_app/common/widgets/height_spacer.dart';

class AddTodo extends ConsumerStatefulWidget {
  const AddTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HeightSpacer(heightSpacing: 20),
            CustomTextField(
              hintText: 'Add title',
              controller: title,
              hintStyle: appStyle(
                16,
                AppConstant.kGreyLight,
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(heightSpacing: 20),
            CustomTextField(
              hintText: 'Add description',
              controller: description,
              hintStyle: appStyle(
                16,
                AppConstant.kGreyLight,
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(heightSpacing: 20),
            CustomButton(
              width: AppConstant.kWidth,
              height: 52.h,
              textButtonColor: AppConstant.kLight,
              buttonColor: AppConstant.kBlueLight,
              text: 'Set Date',
            ),
            const HeightSpacer(heightSpacing: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  ontap: () {},
                  width: AppConstant.kWidth * 0.4,
                  height: 52.h,
                  textButtonColor: AppConstant.kLight,
                  buttonColor: AppConstant.kBlueLight,
                  text: 'Start Time',
                ),
                CustomButton(
                  ontap: () {},
                  width: AppConstant.kWidth * 0.4,
                  height: 52.h,
                  textButtonColor: AppConstant.kLight,
                  buttonColor: AppConstant.kBlueLight,
                  text: 'End Time',
                ),
              ],
            ),
            const HeightSpacer(heightSpacing: 20),
            CustomButton(
              ontap: () {},
              width: AppConstant.kWidth,
              height: 52.h,
              textButtonColor: AppConstant.kLight,
              buttonColor: AppConstant.kBlueLight,
              text: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
