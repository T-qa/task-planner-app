import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_planner_app/common/helpers/notification_helper.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/custom_text_field.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';
import 'package:task_planner_app/common/widgets/width_spacer.dart';
import 'package:task_planner_app/features/todo/controllers/todos/todo_provider.dart';
import 'package:task_planner_app/features/todo/screens/add_todo_screen.dart';
import 'package:task_planner_app/features/todo/widgets/completed_task.dart';
import 'package:task_planner_app/features/todo/widgets/day_after_tomorrow_task.dart';
import 'package:task_planner_app/features/todo/widgets/tomorrow_task.dart';

import '../../../common/widgets/height_spacer.dart';
import '../widgets/today_task.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );
  late NotificationHelper notifierHelper;
  late NotificationHelper notifierController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    notifierHelper = NotificationHelper(ref: ref);
    Future.delayed(const Duration(seconds: 0), () {
      notifierController = NotificationHelper(ref: ref);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: 'DashBoard',
                      style: appStyle(
                        18,
                        AppConstant.kLight,
                        FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: AppConstant.kLight,
                        borderRadius: BorderRadius.all(
                          Radius.circular(9),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddTodo()));
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppConstant.kBkDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(heightSpacing: 20),
              CustomTextField(
                hintText: 'Search',
                controller: _searchController,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      AntDesign.search1,
                      color: AppConstant.kGreyLight,
                    ),
                  ),
                ),
                suffixIcon: const Icon(
                  FontAwesome.sliders,
                  color: AppConstant.kGreyLight,
                ),
              ),
              const HeightSpacer(heightSpacing: 15),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: ListView(
            children: [
              const HeightSpacer(heightSpacing: 25),
              Row(
                children: [
                  const Icon(
                    FontAwesome.tasks,
                    color: AppConstant.kGreyLight,
                  ),
                  const WidthSpacer(widthSpacing: 10),
                  ReusableText(
                    text: 'Today\'s task',
                    style: appStyle(
                      18,
                      AppConstant.kLight,
                      FontWeight.bold,
                    ),
                  )
                ],
              ),
              const HeightSpacer(heightSpacing: 25),
              Container(
                decoration: BoxDecoration(
                  color: AppConstant.kLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConstant.kRadius),
                  ),
                ),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: AppConstant.kGreyLight,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          AppConstant.kRadius,
                        ),
                      ),
                    ),
                    controller: _tabController,
                    labelPadding: EdgeInsets.zero,
                    isScrollable: false,
                    labelColor: AppConstant.kBlueLight,
                    labelStyle: appStyle(
                      24,
                      AppConstant.kBlueLight,
                      FontWeight.w700,
                    ),
                    unselectedLabelColor: AppConstant.kLight,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppConstant.kWidth * 0.5,
                          child: Center(
                            child: ReusableText(
                              text: 'Pending',
                              style: appStyle(
                                16,
                                AppConstant.kBkDark,
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.only(left: 30.w),
                          width: AppConstant.kWidth * 0.5,
                          child: Center(
                            child: ReusableText(
                              text: 'Completed',
                              style: appStyle(
                                16,
                                AppConstant.kBkDark,
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              const HeightSpacer(heightSpacing: 20),
              SizedBox(
                height: AppConstant.kHeight * 0.3,
                width: AppConstant.kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppConstant.kRadius,
                    ),
                  ),
                  child: TabBarView(controller: _tabController, children: [
                    Container(
                        color: AppConstant.kBkLight,
                        height: AppConstant.kHeight * 0.3,
                        child: const TodayTask()),
                    Container(
                      color: AppConstant.kBkLight,
                      height: AppConstant.kHeight * 0.3,
                      child: const CompletedTask(),
                    ),
                  ]),
                ),
              ),
              const HeightSpacer(heightSpacing: 20),
              const TomorrowTask(),
              const HeightSpacer(heightSpacing: 20),
              const DayAfterTomorrowTask()
            ],
          ),
        ),
      ),
    );
  }
}
