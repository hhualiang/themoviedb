import 'package:flutter/material.dart';

import 'config/route/app_route.dart';
import 'config/route/route_names.dart';
import 'core/util/local_push_notification.dart';

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static const String _debugLabel = 'Main Navigator';
  LocalPushNotificationPlugin pushNotificationPlugin =
      LocalPushNotificationPlugin();
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: _debugLabel);

  @override
  void initState() {
    super.initState();
    pushNotificationPlugin.initNotification(navigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
