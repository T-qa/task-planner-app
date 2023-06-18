import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_planner_app/features/todo/screens/notification_screen.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../models/task.dart';

class NotificationHelper {
  final WidgetRef ref;
  NotificationHelper({required this.ref});

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  String? selectedNotificationPayload;
  final BehaviorSubject<String?> selectedNotificationSubject =
      BehaviorSubject<String?>();

  initializeNotification() async {
    _configureSelectNotificaionSubject();
    await _configureLocalTimeZone();
    final DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('calendar');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (data) async {
      if (data != null) {
        debugPrint('notifcation payload: ${data.payload}');
      }
      selectedNotificationSubject.add(data.payload);
    });
  }

  void requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    const String timeZoneName = 'Asia/Shanghai';
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    showDialog(
      context: ref.context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title ?? ''),
        content: Text(body ?? ''),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('View'),
          ),
        ],
      ),
    );
  }

  scheduledNotification(
      int days, int hours, int minutes, int seconds, Task task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        task.id ?? 0,
        task.title,
        task.desc,
        tz.TZDateTime.now(tz.local).add(Duration(
            days: days, hours: hours, minutes: minutes, seconds: seconds)),
        const NotificationDetails(
          android:
              AndroidNotificationDetails('Your channel id', 'Your channel nam'),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload:
            '${task.title}|${task.desc}|${task.date}|${task.startTime}|${task.endTime}');
  }

  _configureSelectNotificaionSubject() {
    selectedNotificationSubject.stream.listen(
      (String? payload) async {
        var title = payload!.split('|')[0];
        var body = payload.split('|')[0];
        showDialog(
          context: ref.context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(
              body,
              textAlign: TextAlign.justify,
              maxLines: 4,
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NotificationScreen(payload: payload),
                    ),
                  );
                },
                child: const Text('View'),
              ),
            ],
          ),
        );
      },
    );
  }
}
