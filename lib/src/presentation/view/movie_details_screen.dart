import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entity/movie.dart';
import '../bloc/movie_genres_controller.dart';
import '../widget/movie_screen/movie_genres/genres_section.dart';
import '../widget/movie_screen/movie_overview/container_overview.dart';
import '../widget/movie_screen/movie_screen_information.dart';
import '../widget/movie_screen/movie_screen_movie_app_bar.dart';
import '../widget/movie_screen/movie_screen_title_text_style.dart';

class ScreenMovieDetails extends StatefulWidget {
  const ScreenMovieDetails({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<ScreenMovieDetails> createState() => _ScreenMovieDetailsState();
}

class _ScreenMovieDetailsState extends State<ScreenMovieDetails> {
  static const double _verticalSpacerValue = 15;
  static const double _horizontalSpacerValue = 30;
  static const String _overviewLabel = 'Overview';

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
  );

  @override
  void initState() {
    super.initState();
  }

  Widget _horizontalSpacer(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget _verticalSpacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    final MovieDetailsController movieGenreController =
        Provider.of<MovieDetailsController>(
      context,
      listen: false,
    );
    movieGenreController.initialize();
    return Scaffold(
      extendBody: true,
      appBar: MovieAppBar(
        movieTitle: widget.movie.originalTitle,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                MovieBasicInfoDisplay(
                  movie: widget.movie,
                ),
                GenresSection(
                  genresIds: widget.movie.genreIds,
                  genresStream: movieGenreController.genresStream,
                ),
                Column(
                  children: <Widget>[
                    const TitleText(
                      text: _overviewLabel,
                    ),
                    ContainerOverview(
                      overviewText: widget.movie.overviewText,
                    ),
                  ],
                ),
                _verticalSpacer(
                  _verticalSpacerValue,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _horizontalSpacer(
                      _horizontalSpacerValue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
