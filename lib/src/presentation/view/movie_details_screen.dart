import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/util/enum_classes.dart';
import '../../domain/entity/movie.dart';
import '../bloc/movie_genres_controller.dart';
import '../widget/movie_screen/movie_genres/genres_section.dart';
import '../widget/movie_screen/movie_overview/container_overview.dart';
import '../widget/movie_screen/movie_screen_information.dart';
import '../widget/movie_screen/movie_screen_like_counter.dart';
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
  static const int _initialCounterValue = 0;
  static const int _incrementValue = 1;
  static const String _sharedPreferencesKeyCounter = 'counter';
  static const String _overviewLabel = 'Overview';
  int _counter = _initialCounterValue;
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        sharedPreferenceInstance = await SharedPreferences.getInstance();
        _changeCounter(
          CounterAction.load,
        );
      },
    );
  }

  late final SharedPreferences sharedPreferenceInstance;

  void _changeCounter(CounterAction action) {
    setState(
      () {
        switch (action) {
          case CounterAction.load:
            _counter = (sharedPreferenceInstance.getInt(
                  _sharedPreferencesKeyCounter,
                ) ??
                _initialCounterValue);
            break;
          case CounterAction.increment:
            _counter = (sharedPreferenceInstance.getInt(
                      _sharedPreferencesKeyCounter,
                    ) ??
                    _initialCounterValue) +
                _incrementValue;
            sharedPreferenceInstance.setInt(
              _sharedPreferencesKeyCounter,
              _counter,
            );
            break;
          default:
            break;
        }
      },
    );
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
    final MovieGenresController movieGenreController =
        Provider.of<MovieGenresController>(
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
                    ContainerCounter(
                      counter: _counter,
                    ),
                    _horizontalSpacer(
                      _horizontalSpacerValue,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _changeCounter(
                          CounterAction.increment,
                        );
                      },
                      style: buttonStyle,
                      child: IconButton(
                        icon: const Icon(
                          Icons.thumb_up,
                        ),
                        color: Colors.black,
                        onPressed: () {
                          _changeCounter(
                            CounterAction.increment,
                          );
                        },
                      ),
                    ),
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
