import 'package:flutter/material.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';

import '../../../common/widgets/height_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReusableText(
          text: 'Task Planner',
          style: appStyle(
            26,
            AppConstant.kGreen,
            FontWeight.bold,
          ),
        ),
        const HeightSpacer(
          heightSpacing: 30,
        ),
        ReusableText(
          text: 'Task Planner',
          style: appStyle(
            26,
            AppConstant.kGreen,
            FontWeight.bold,
          ),
        ),
      ],
    ));
  }
}
