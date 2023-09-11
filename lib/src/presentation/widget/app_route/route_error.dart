import 'package:flutter/material.dart';

import '../../../core/util/ui_text.dart';

class ErrorRoute {
  static Route<dynamic> routeError() {
    return MaterialPageRoute<dynamic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              UiText.routeError,
            ),
          ),
          body: const Center(
            child: Text(
              UiText.routeError,
            ),
          ),
        );
      },
    );
  }
}
