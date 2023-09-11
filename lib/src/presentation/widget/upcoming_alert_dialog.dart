import 'package:flutter/material.dart';

abstract class ShowUpcomingAlertDialog {
  static const String _okLabel = 'OK';
  static const String _upcomingFeature = 'Upcoming feature';
  static const String _upcomingFeatureText =
      'This is a  upcoming feature that does not work yet';

  static void showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text(
        _okLabel,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        _upcomingFeature,
      ),
      content: const Text(
        _upcomingFeatureText,
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
