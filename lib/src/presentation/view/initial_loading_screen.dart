import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../config/route/route_names.dart';
import '../../core/util/enum_classes.dart';
import '../../core/util/ui_constants.dart';
import '../../core/util/ui_string.dart';
import '../../domain/entity/movie_state.dart';
import '../bloc/movie_controller.dart';

class InitialLoadingScreen extends StatefulWidget {
  const InitialLoadingScreen({super.key});

  @override
  State<InitialLoadingScreen> createState() => _InitialLoadingScreenState();
}

class _InitialLoadingScreenState extends State<InitialLoadingScreen> {
  static const double _movieIconSize = 120;
  static const double _appNameFontSize = 30;

  late final MovieController movieController;
  late final StreamSubscription<dynamic> movieSub;

  @override
  void initState() {
    super.initState();
    movieController = Provider.of<MovieController>(
      context,
      listen: false,
    );
    movieController.initialize();

    movieSub = movieController.moviesStream.listen((MovieState event) {
      if (event.state == BaseState.success || event.state == BaseState.empty) {
        Navigator.of(context).pushReplacementNamed(
          RouteNames.home,
        );
      }
    });

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    movieSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieState>(
      stream: movieController.moviesStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<MovieState> snapshot,
      ) {
        switch (snapshot.data?.state) {
          case BaseState.success:
          case BaseState.empty:
            return const SizedBox();
          case BaseState.failure:
            return Center(
              child: Text(
                snapshot.data!.error!,
              ),
            );
          default:
            return Scaffold(
              body: Center(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF40e0d0),
                        Color(0xFFFF5349),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.movie_filter,
                        size: _movieIconSize,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: UiConstants.normalVerticalSpacerHeight,
                      ),
                      Text(
                        UiString.appTitle,
                        style: TextStyle(
                          fontSize: _appNameFontSize,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
