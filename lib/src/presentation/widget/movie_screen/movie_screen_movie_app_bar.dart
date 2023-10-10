import 'package:flutter/material.dart';

import '../../../core/util/widget_keys.dart';
import '../upcoming_alert_dialog.dart';

class MovieAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MovieAppBar({
    super.key,
    required this.movieTitle,
  });

  final String movieTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: const Key(WidgetKey.movieDetailsAppBar),
      title: Text(
        movieTitle,
      ),
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
          ),
          onPressed: () {
            ShowUpcomingAlertDialog.showAlertDialog(context);
          },
        ),
      ],
    );
  }
}
