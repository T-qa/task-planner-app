import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/custom_button.dart';
import 'package:task_planner_app/common/widgets/custom_text_field.dart';
import 'package:task_planner_app/common/widgets/height_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:task_planner_app/features/todo/controllers/dates/dates_provider.dart';
import 'package:task_planner_app/features/todo/controllers/todos/todo_provider.dart';

import '../../../common/models/task.dart';

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
    var scheduleDate = ref.watch(dateStateProvider);
    var startTime = ref.watch(startTimeStateProvider);
    var endTime = ref.watch(startTimeStateProvider);
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
              ontap: () {
                picker.DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2023, 6, 15),
                  maxTime: DateTime(2024, 6, 15),
                  theme: const picker.DatePickerTheme(
                      doneStyle:
                          TextStyle(color: AppConstant.kGreen, fontSize: 16)),
                  onConfirm: (date) {
                    ref.read(dateStateProvider.notifier).setDate(
                          date.toString(),
                        );
                  },
                  currentTime: DateTime.now(),
                  locale: picker.LocaleType.en,
                );
              },
              width: AppConstant.kWidth,
              height: 52.h,
              textButtonColor: AppConstant.kLight,
              buttonColor: AppConstant.kBlueLight,
              text: scheduleDate == ''
                  ? 'Set Date'
                  : scheduleDate.substring(0, 10),
            ),
            const HeightSpacer(heightSpacing: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  ontap: () {
                    picker.DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      onConfirm: (date) {
                        ref.read(startTimeStateProvider.notifier).setStart(
                              date.toString(),
                            );
                      },
                      locale: picker.LocaleType.en,
                    );
                  },
                  width: AppConstant.kWidth * 0.4,
                  height: 52.h,
                  textButtonColor: AppConstant.kLight,
                  buttonColor: AppConstant.kBlueLight,
                  text: startTime == ''
                      ? 'Start Time'
                      : startTime.substring(10, 16),
                ),
                CustomButton(
                  ontap: () {
                    picker.DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      onConfirm: (date) {
                        ref.read(finishTimeStateProvider.notifier).setStart(
                              date.toString(),
                            );
                      },
                      locale: picker.LocaleType.en,
                    );
                  },
                  width: AppConstant.kWidth * 0.4,
                  height: 52.h,
                  textButtonColor: AppConstant.kLight,
                  buttonColor: AppConstant.kBlueLight,
                  text: endTime == '' ? 'End Time' : endTime.substring(10, 16),
                ),
              ],
            ),
            const HeightSpacer(heightSpacing: 20),
            CustomButton(
              ontap: () {
                Task task = Task(
                  title: title.text,
                  desc: description.text,
                  isCompleted: 0,
                  date: scheduleDate,
                  startTime: startTime.substring(10, 16),
                  endTime: endTime.substring(10, 16),
                  remind: 0,
                  repeat: 'Yes',
                );
                if (title.text.isNotEmpty &&
                    description.text.isNotEmpty &&
                    scheduleDate.isNotEmpty &&
                    startTime.isNotEmpty &&
                    endTime.isNotEmpty) {
                  ref.read(todoStateProvider.notifier).addItem(task);
                  ref.read(finishTimeStateProvider.notifier).setStart('');
                  ref.read(startTimeStateProvider.notifier).setStart('');
                  ref.read(dateStateProvider.notifier).setDate('');
                  Navigator.pop(context);
                } else {
                  print('failed');
                }
              },
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
