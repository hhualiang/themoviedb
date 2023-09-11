import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/repository/movie_repository.dart';
import '../../domain/entity/movie.dart';
import '../../domain/usecase/usecase_impl/get_genres_usecase_impl.dart';
import '../../domain/usecase/usecase_impl/get_movies_usecase_impl.dart';
import '../../presentation/bloc/movie_controller.dart';
import '../../presentation/bloc/movie_genres_controller.dart';
import '../../presentation/view/about_the_app_screen.dart';
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
          builder: (_) => Provider<MovieController>(
            create: (_) => MovieController(
              getMoviesUseCase: GetMoviesUseCase(
                repository: MovieRepository.instance(),
              ),
            ),
            child: const InitialLoadingScreen(),
          ),
        );
      case RouteNames.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Provider<MovieController>(
            create: (_) => MovieController(
              getMoviesUseCase: GetMoviesUseCase(
                repository: MovieRepository.instance(),
              ),
            ),
            child: const HomePage(),
          ),
        );
      case RouteNames.movieDetails:
        final Movie arguments = settings.arguments as Movie;
        return MaterialPageRoute<dynamic>(
          builder: (_) => Provider<MovieGenresController>(
            create: (_) => MovieGenresController(
              getGenresUseCase: GetGenresUseCase(
                repository: MovieRepository.instance(),
              ),
            ),
            child: ScreenMovieDetails(movie: arguments),
          ),
        );
      case RouteNames.aboutTheApp:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AboutTheApp(),
        );
      default:
        return ErrorRoute.routeError();
    }
  }
}
