import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/features/auth/controllers/user_controller.dart';
import 'package:task_planner_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:task_planner_app/features/todo/screens/home_page_screen.dart';

import 'common/models/user.dart';
import 'common/routes/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  );
  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(userProvider.notifier).refresh();
    List<User> users = ref.watch(userProvider);
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return DynamicColorBuilder(
            builder: (lightColorScheme, darkColorScheme) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'T-qa',
                  theme: ThemeData(
                    scaffoldBackgroundColor: AppConstant.kBkDark,
                    colorScheme: lightColorScheme ?? defaultLightColorScheme,
                    useMaterial3: true,
                  ),
                  darkTheme: ThemeData(
                    colorScheme: darkColorScheme ?? defaultDarkColorScheme,
                  ),
                  themeMode: ThemeMode.dark,
                  home: users.isEmpty ? const OnBoarding() : const HomePage(),
                  onGenerateRoute: Routes.onGenerateRoute);
            },
          );
        });
  }
}
