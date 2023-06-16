import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/features/todo/widgets/todo_tile.dart';

import '../../../common/models/task.dart';
import '../controllers/todos/todo_provider.dart';

class CompletedTask extends ConsumerWidget {
  const CompletedTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listTask = ref.watch(todoStateProvider);
    String lastMonth = ref.read(todoStateProvider.notifier).getLast30Days();
    var completedList = listTask
        .where((element) =>
            element.isCompleted == 1 ||
            lastMonth.contains(element.date!.substring(0, 10)))
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        final data = completedList[index];
        dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
        return TodoTile(
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
            },
            editWidget: const SizedBox.shrink(),
            title: data.title,
            description: data.desc,
            start: data.startTime,
            end: data.endTime,
            color: color,
            switcher: const Icon(
              AntDesign.checkcircle,
              color: AppConstant.kGreen,
            ));
      },
      itemCount: completedList.length,
    );
  }
}
