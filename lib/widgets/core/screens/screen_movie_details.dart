import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/widgets/custom_widgets.dart';

class ScreenMovieDetails extends StatefulWidget {
  const ScreenMovieDetails({super.key});

  @override
  State<ScreenMovieDetails> createState() => _ScreenMovieDetailsState();
}

class _ScreenMovieDetailsState extends State<ScreenMovieDetails> {
  int _counter = UiConstants.kCounterValueZero;
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
  );
  final movie = Movie(
    title: UiText.movieFullTitle,
    releaseDate: UiText.movieReleaseDate,
    rating: UiText.movieRating,
    largePhotoURL: UiText.networkImageWidePhotoLink,
    smallPhotoURL: UiText.networkImageSmallPhotoLink,
    genres: [
      UiText.movieGenreAnimation,
      UiText.movieGenreFamily,
      UiText.movieGenreAdventure,
      UiText.movieGenreFantasy,
      UiText.movieGenreComedy
    ],
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
        movieTitle: movie.title,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            MovieBasicInfoDisplay(
              movie: movie,
            ),
            GenresSection(
              genres: movie.genres,
            ),
            const Column(
              children: [
                TitleText(
                  text: UiText.overviewLabel,
                ),
                ContainerOverview(),
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
