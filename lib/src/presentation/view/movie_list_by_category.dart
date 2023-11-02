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
  static const double _padding = 8.0;
  static const double _horizontalEdgePadding = 30;
  static const double _verticalEdgePadding = 10;
  static const double _borderSideWidth = 3.1;
  static const double _borderRadius = 30;
  static const double _sizedBoxHeight = 10;

  String lastInputValue = '';
  late MovieController movieController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieController = Provider.of<MovieController>(
      context,
      listen: false,
    );

    movieController.fetchMovieByCategory(widget.category);
    fieldText.clear();
  }

  final TextEditingController fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(_padding),
              child: TextField(
                onChanged: (String text) {
                  movieController.searchMovie(
                    text,
                    widget.category,
                  );
                },
                controller: fieldText,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: _horizontalEdgePadding,
                    vertical: _verticalEdgePadding,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: _borderSideWidth,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(_borderRadius),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: _sizedBoxHeight,
            ),
            Expanded(
              child: MovieStreamBuilder(
                stream: movieController.moviesStream,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
