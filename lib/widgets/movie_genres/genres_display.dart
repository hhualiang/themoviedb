import 'package:flutter/material.dart';

import '/widgets/custom_widgets.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({
    super.key,
    required this.genres,
  });

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TitleText(
            text: UiText.movieGenresLabel,
          ),
          SizedBox(
            height: UiConstants.genresSizedBoxListViewMovieGenres,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return GenresText(text: genres[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
