import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../config/route/route_names.dart';

void onDidReceiveBackgroundNotificationResponse(
  NotificationResponse notificationResponse,
) {}

class LocalPushNotificationPlugin {
  static const String _logoName = 'flutter_logo';
  static const String _channelID = 'channelId';
  static const String _channelName = 'channelName';
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification(GlobalKey<NavigatorState> navigatorKey) async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings(_logoName);

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        Navigator.pushNamed(
          navigatorKey.currentContext!,
          RouteNames.favouriteMovies,
        );
      },
    );
  }

  Future<dynamic> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    await notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
    );
    return;
  }

  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        _channelID,
        _channelName,
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }
}
