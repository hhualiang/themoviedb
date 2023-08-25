import 'package:flutter/material.dart';

import '/widgets/custom_widgets.dart';

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
      title: Text(
        movieTitle,
      ),
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          ShowUpcomingAlertDialog.showAlertDialog(context);
        },
      ),
      actions: [
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
