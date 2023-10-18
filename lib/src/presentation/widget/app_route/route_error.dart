import 'package:flutter/material.dart';

import '../../../core/util/ui_string.dart';

class ErrorRoute {
  static Route<dynamic> routeError() {
    return MaterialPageRoute<dynamic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              UiString.routeError,
            ),
          ),
          body: const Center(
            child: Text(
              UiString.routeError,
            ),
          ),
        );
      },
    );
  }
}
