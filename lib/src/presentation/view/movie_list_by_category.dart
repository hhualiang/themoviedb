import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/movie_controller.dart';
import '../widget/home_screen/home_screen_movies_stream_builder.dart';

class MoviesByCategory extends StatefulWidget {
  const MoviesByCategory({
    super.key,
    required this.category,
  });

  final String category;

  @override
  State<MoviesByCategory> createState() => _MoviesByCategoryState();
}

class _MoviesByCategoryState extends State<MoviesByCategory> {
  @override
  @override
  Widget build(BuildContext context) {
    final MovieController movieController = Provider.of<MovieController>(
      context,
      listen: false,
    );
    movieController.fetchMovieByCategory(widget.category);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: MovieStreamBuilder(
          stream: movieController.moviesStream,
        ),
      ),
    );
  }
}
