import 'package:flutter/material.dart';

import '../../../../core/util/enum_classes.dart';
import '../../../../core/util/genres_converter.dart';
import '../../../../core/util/widget_keys.dart';
import '../../../../domain/entity/genre_state.dart';
import '../movie_screen_title_text_style.dart';
import 'genres_text.dart';

class GenresSection extends StatefulWidget {
  const GenresSection({
    super.key,
    required this.genresStream,
    required this.genresIds,
  });

  final Stream<GenresState> genresStream;

  final List<int> genresIds;

  @override
  State<GenresSection> createState() => _GenresSectionState();
}

class _GenresSectionState extends State<GenresSection> {
  static const double _sizedBoxHeight = 28;
  static const String _movieGenresLabel = 'Genres';

  @override
  void initState() {
    super.initState();
  }

  late List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const Key(WidgetKey.movieDetailsGenresSection),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const TitleText(
            text: _movieGenresLabel,
          ),
          SizedBox(
            height: _sizedBoxHeight,
            child: StreamBuilder<GenresState>(
              stream: widget.genresStream,
              builder: (
                BuildContext context,
                AsyncSnapshot<GenresState> snapshot,
              ) {
                switch (snapshot.data?.state) {
                  case BaseState.success:
                    genres = GenresConverter().getGenresByIds(
                      widget.genresIds,
                      snapshot.data!.genreList,
                    );
                    return ListView.builder(
                      key: const Key(WidgetKey.genresSectionListView),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: genres.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return GenresText(
                          text: genres[index],
                        );
                      },
                    );
                  case BaseState.empty:
                    return const SizedBox.shrink();
                  case BaseState.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case BaseState.failure:
                    return Center(
                      child: Text(
                        snapshot.data!.error!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  default:
                    return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
