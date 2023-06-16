import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_planner_app/features/todo/controllers/todos/todo_provider.dart';
import 'package:task_planner_app/features/todo/widgets/todo_tile.dart';

import '../../../common/utils/constants.dart';
import '../../../common/widgets/tile_expansion.dart';
import '../controllers/expansion_provider.dart';
import '../screens/update_todo_screen.dart';

class DayAfterTomorrowTask extends ConsumerWidget {
  const DayAfterTomorrowTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    var color = ref.read(todoStateProvider.notifier).getRandomColor();
    String dayAfterTomorrow =
        ref.read(todoStateProvider.notifier).getTomorrow();

    var tomorrowTask =
        todos.where((element) => element.date!.contains(dayAfterTomorrow));
    return TileExpansion(
      text: DateTime.now()
          .add(const Duration(days: 2))
          .toString()
          .substring(5, 10),
      text2: 'Tomorrow \'s Task are shown here',
      onExpansionChanged: (bool expanded) {
        ref.read(expansionStateProvider.notifier).setStart(!expanded);
      },
      trailing: ref.watch(expansionStateProvider)
          ? Padding(
              padding: EdgeInsets.only(right: 12.0.w),
              child: const Icon(
                AntDesign.circledown,
              ),
            )
          : const Icon(
              AntDesign.closecircle,
            ),
      children: [
        for (final todo in tomorrowTask)
          TodoTile(
            title: todo.title,
            description: todo.desc,
            color: color,
            start: todo.startTime,
            end: todo.endTime,
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: () {
                titles = todo.title.toString();
                descriptions = todo.desc.toString();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateTask(id: todo.id ?? 0),
                  ),
                );
              },
              child: const Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            switcher: const SizedBox.shrink(),
          ),
      ],
    );
  }
}
