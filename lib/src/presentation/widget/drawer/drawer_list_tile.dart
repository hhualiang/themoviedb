import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  static const double _listTileWidth = 2;
  static const double _listTileBorderRadius = 50;

  const DrawerListTile({
    super.key,
    required this.section,
    required this.route,
  });

  final String route;
  final String section;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        section,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: _listTileWidth,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(
          _listTileBorderRadius,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}
