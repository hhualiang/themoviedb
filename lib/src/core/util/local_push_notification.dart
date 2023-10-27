import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notificationResponse) {}

class LocalPushNotificationPlugin {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('flutter_logo');

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
      onDidReceiveNotificationResponse: (NotificationResponse details) {},
    );
  }

  Future<dynamic> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    await notificationsPlugin.show(id, title, body, notificationDetails(),
        payload: 'aaa');
    return;
  }

  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }
}
