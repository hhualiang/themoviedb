import 'package:flutter/material.dart';

import '../../domain/entity/movie.dart';
import '../../presentation/view/about_the_app_screen.dart';
import '../../presentation/view/favourite_screen.dart';
import '../../presentation/view/home_screen.dart';
import '../../presentation/view/initial_loading_screen.dart';
import '../../presentation/view/movie_details_screen.dart';
import '../../presentation/widget/app_route/route_error.dart';
import 'route_names.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const InitialLoadingScreen(),
        );
      case RouteNames.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const HomePage(),
        );
      case RouteNames.movieDetails:
        final Movie arguments = settings.arguments as Movie;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ScreenMovieDetails(movie: arguments),
        );
      case RouteNames.aboutTheApp:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AboutTheApp(),
        );
      case RouteNames.favouriteMovies:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const FavouritePage(),
        );
      default:
        return ErrorRoute.routeError();
    }
  }
}
