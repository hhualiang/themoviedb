import 'package:flutter/material.dart';

import '../../../../utils/ui_text.dart';
import '../../upcoming_alert_dialog.dart';


class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white38,
      title: const Text(
        UiText.appTitle,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            ShowUpcomingAlertDialog.showAlertDialog(
              context,
            );
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
