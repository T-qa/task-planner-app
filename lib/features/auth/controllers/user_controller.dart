import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_planner_app/common/helpers/db_helper.dart';

import '../../../common/models/user.dart';

final userProvider = StateNotifierProvider<UserState, List<User>>((ref) {
  return UserState();
});

class UserState extends StateNotifier<List<User>> {
  UserState() : super([]);

  void refresh() async {
    final data = await DbBHelper.getUser();

    state = data.map((e) => User.fromMap(e)).toList();
  }
}
