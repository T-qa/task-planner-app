import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_planner_app/features/todo/widgets/todo_tile.dart';

import '../../../common/models/task.dart';
import '../../../common/utils/constants.dart';
import '../controllers/todos/todo_provider.dart';
import '../screens/update_todo_screen.dart';

class TodayTask extends ConsumerWidget {
  const TodayTask({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listTask = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listTask
        .where((element) =>
            element.isCompleted == 0 && element.date!.contains(today))
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        final data = todayList[index];
        bool isCompleted = ref.read(todoStateProvider.notifier).getStatus(data);
        dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
        return TodoTile(
          delete: () {
            ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
          },
          editWidget: GestureDetector(
            onTap: () {
               titles = data.title.toString();
                descriptions = data.desc.toString();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateTask(id: data.id ?? 0),
                ),
              );
            },
            child: const Icon(MaterialCommunityIcons.circle_edit_outline),
          ),
          title: data.title,
          description: data.desc,
          start: data.startTime,
          end: data.endTime,
          color: color,
          switcher: Switch(
            value: isCompleted,
            onChanged: (value) {
              ref.read(todoStateProvider.notifier).markAsCompleted(
                    data.id ?? 0,
                    data.title.toString(),
                    data.desc.toString(),
                    1,
                    data.date.toString(),
                    data.startTime.toString(),
                    data.endTime.toString(),
                  );
            },
          ),
        );
      },
      itemCount: todayList.length,
    );
  }
}
