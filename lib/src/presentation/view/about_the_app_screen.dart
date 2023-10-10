import 'package:flutter/material.dart';

import '../../core/util/ui_text.dart';
import '../widget/drawer/app_drawer_format.dart';

class AboutTheApp extends StatelessWidget {
  static const String _appDescription =
      'The Movie Database (TMDB) is a community built movie and TV database. Every piece of data has been added by our '
      'amazing community dating back to 2008. TMDB has strong international focus and breadth of data is '
      'largely unmatched and something we are incredibly proud of. Put simply, we live and breathe community and thats precisely what makes us different.';

  const AboutTheApp({super.key});

  static const double _descriptionFontSize = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          UiText.appTitle,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.white,
        child: AppDrawerFormat(),
      ),
      body: Container(
        color: Colors.black,
        child: const Center(
          child: Text(
            _appDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: _descriptionFontSize,
            ),
          ),
        ),
      ),
    );
  }
}
