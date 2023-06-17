import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_planner_app/features/auth/screens/login_screen.dart';
import 'package:task_planner_app/features/auth/screens/otp_screen.dart';
import 'package:task_planner_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:task_planner_app/features/todo/screens/home_page_screen.dart';

class Routes {
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String otp = 'otp';
  static const String home = 'home';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (context) => const OnBoarding());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case otp:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => OTPScreen(
            phone: args['phone'],
            smsCodeId: args['smsCodeId'],
          ),
        );
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());

      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
