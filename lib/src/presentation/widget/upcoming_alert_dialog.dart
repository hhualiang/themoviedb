import 'package:flutter/material.dart';

import '../../core/util/ui_text.dart';

abstract class ShowUpcomingAlertDialog {
  static void showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text(
        UiText.alertDialogOkLabel,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        UiText.alertDialogUpcomingFeature,
      ),
      content: const Text(
        UiText.alertDialogUpcomingFeatureText,
      ),
      actions: <Widget>[
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
