import 'package:flutter/material.dart';

import '../../../config/route/route_names.dart';
import '../../../core/util/ui_constants.dart';
import '../../../core/util/widget_keys.dart';
import 'drawer_list_tile.dart';

class AppDrawerFormat extends StatelessWidget {
  static const double _sizedBoxHeight = 80;
  static const double _dividerThickness = 3;
  static const String _drawerTitle = 'Movie DB';
  static const String _drawerOptionHome = 'Home';
  static const String _drawerOptionAboutTheApp = 'About the app';

  const AppDrawerFormat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const Key(WidgetKey.appDrawerListView),
      children: const <Widget>[
        SizedBox(
          height: _sizedBoxHeight,
          child: DrawerHeader(
            child: Text(
              _drawerTitle,
              style: TextStyle(
                fontSize: UiConstants.normalFontSize,
              ),
            ),
          ),
        ),
        Divider(
          thickness: _dividerThickness,
          color: Colors.white,
        ),
        DrawerListTile(
          section: _drawerOptionHome,
          route: RouteNames.home,
        ),
        DrawerListTile(
          section: _drawerOptionAboutTheApp,
          route: RouteNames.aboutTheApp,
        ),
      ],
    );
  }
}
