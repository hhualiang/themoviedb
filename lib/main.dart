import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/core/util/dependency_initializer.dart';
import 'src/core/util/local_push_notification.dart';
import 'src/data/datasource/local/movie_database.dart';
import 'src/presentation/bloc/fav_movie_controller.dart';
import 'src/presentation/bloc/movie_controller.dart';
import 'src/presentation/bloc/movie_genres_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalPushNotificationPlugin().initNotification();
  final DependencyInitializer dependencyInitializer = DependencyInitializer();
  await dependencyInitializer.initialize();
  runApp(
    MultiProvider(
      providers: <Provider<dynamic>>[
        Provider<MovieDetailsController>(
          create: (_) => dependencyInitializer.genresController,
        ),
        Provider<MovieController>(
          create: (_) => dependencyInitializer.movieController,
        ),
        Provider<MovieDatabase>(
          create: (_) => dependencyInitializer.movieDatabase,
        ),
        Provider<FavouriteMovieController>(
          create: (_) => dependencyInitializer.favMovieController,
        ),
      ],
      child: const App(),
    ),
  );
}
