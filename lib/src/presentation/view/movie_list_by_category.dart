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
              padding: const EdgeInsets.all(8.0),
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3.1, color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
