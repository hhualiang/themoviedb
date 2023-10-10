import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';
import 'app_drawer_format.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      key: Key(WidgetKey.appDrawer),
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.white,
      child: AppDrawerFormat(),
    );
  }
}
