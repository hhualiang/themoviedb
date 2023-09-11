import 'package:flutter/material.dart';

import 'config/route/app_route.dart';
import 'config/route/route_names.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
