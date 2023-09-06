import 'package:flutter/material.dart';

import '../../../../data/repository/local_repository.dart';
import '../../../../../src/core/util/ui_constants.dart';
import '../../../../../src/core/util/ui_text.dart';
import '../movie_screen_title_text_style.dart';
import 'genres_text.dart';

class GenresSection extends StatefulWidget {
  const GenresSection({
    super.key,
    required this.genresIds,
  });

  final List<int> genresIds;

  @override
  State<GenresSection> createState() => _GenresSectionState();
}

class _GenresSectionState extends State<GenresSection> {
  late Future<List<String>> genres;

  @override
  void initState() {
    super.initState();
    LocalRepository movieRepository = LocalRepository();
    genres = movieRepository.getGenresByIds(widget.genresIds);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const TitleText(
            text: UiText.movieGenresLabel,
          ),
          SizedBox(
            height: UiConstants.genresSizedBoxListViewMovieGenres,
            child: FutureBuilder<List<String>>(
              future: genres,
              builder: (
                BuildContext context,
                AsyncSnapshot<List<String>> snapshot,
              ) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return GenresText(
                        text: snapshot.data![index],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
