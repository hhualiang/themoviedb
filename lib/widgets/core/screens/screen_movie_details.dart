import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/movie_data_class.dart';
import '../../../utils/enum_classes.dart';
import '../../../utils/ui_constants.dart';
import '../../../utils/ui_text.dart';
import 'movie_screen_files/movie_genres/genres_section.dart';
import 'movie_screen_files/movie_overview/container_overview.dart';
import 'movie_screen_files/movie_screen_information.dart';
import 'movie_screen_files/movie_screen_like_counter.dart';
import 'movie_screen_files/movie_screen_movie_app_bar.dart';
import 'movie_screen_files/movie_screen_title_text_style.dart';

class ScreenMovieDetails extends StatefulWidget {
  const ScreenMovieDetails({
    super.key,
    required this.movie,
  });

  final MovieFile movie;

  @override
  State<ScreenMovieDetails> createState() => _ScreenMovieDetailsState();
}

class _ScreenMovieDetailsState extends State<ScreenMovieDetails> {
  int _counter = UiConstants.kCounterValueZero;
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
                  UiText.sharedPreferencesKeyCounter,
                ) ??
                UiConstants.kCounterValueZero);
            break;
          case CounterAction.increment:
            _counter = (sharedPreferenceInstance.getInt(
                      UiText.sharedPreferencesKeyCounter,
                    ) ??
                    UiConstants.kCounterValueZero) +
                UiConstants.kCounterIncrementValueOne;
            sharedPreferenceInstance.setInt(
              UiText.sharedPreferencesKeyCounter,
              _counter,
            );
            break;
          default:
            break;
        }
      },
    );
  }

  Widget _horizontalSpacer(width) {
    return SizedBox(
      width: width,
    );
  }

  Widget _verticalSpacer(height) {
    return SizedBox(
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MovieAppBar(
        movieTitle: widget.movie.originalTitle,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            MovieBasicInfoDisplay(
              movie: widget.movie,
            ),
            GenresSection(
              genresIds: widget.movie.genreIds,
            ),
            Column(
              children: [
                const TitleText(
                  text: UiText.overviewLabel,
                ),
                ContainerOverview(
                  overviewText: widget.movie.overviewText,
                ),
              ],
            ),
            _verticalSpacer(
              UiConstants.kSpacerValueFifteen,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ContainerCounter(
                  counter: _counter,
                ),
                _horizontalSpacer(
                  UiConstants.likeButtonSizedBoxWidth,
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
                  UiConstants.kSpacerValueFifteen,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
