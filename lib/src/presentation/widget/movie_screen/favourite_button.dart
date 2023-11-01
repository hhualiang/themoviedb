import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/util/local_push_notification.dart';
import '../../../domain/entity/fav_movie.dart';
import '../../bloc/fav_movie_controller.dart';

class FavouriteButton extends StatefulWidget {
  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();

  final int movieId;

  const FavouriteButton({
    super.key,
    required this.movieId,
  });
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool _favourite = false;
  static const String _addedFavouriteTitle = 'Added to Favourites';
  static const String _addedFavouriteBody =
      'The movie has been added to Favourites';
  static const String _removedFavouriteTitle = 'Removed from Favourites';
  static const String _removedFavouriteBody =
      'The movie has been removed form Favourites';

  Future<void> _toggleFavourite(
    FavouriteMovieController favouriteMovieController,
  ) async {
    setState(() {
      _favourite = !_favourite;
    });
    if (_favourite) {
      await favouriteMovieController
          .saveFavouriteMovie(
            FavouriteMovies(
              id: widget.movieId,
            ),
          )
          .then(
            (_) => LocalPushNotificationPlugin().showNotification(
              title: _addedFavouriteTitle,
              body: _addedFavouriteBody,
            ),
          );
    } else {
      await favouriteMovieController.deleteFavouriteMovie(
        FavouriteMovies(
          id: widget.movieId,
        ),
      );
      LocalPushNotificationPlugin().showNotification(
        title: _removedFavouriteTitle,
        body: _removedFavouriteBody,
      );
    }
  }

  Future<void> _checkExist(
    FavouriteMovieController favouriteMovieController,
  ) async {
    bool result = await favouriteMovieController.existFavourite(widget.movieId);
    if (result) {
      setState(() {
        _favourite = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final FavouriteMovieController favouriteMovieController =
          Provider.of<FavouriteMovieController>(
        context,
        listen: false,
      );
      _checkExist(favouriteMovieController);
    });
  }

  @override
  Widget build(BuildContext context) {
    final FavouriteMovieController favouriteMovieController =
        Provider.of<FavouriteMovieController>(
      context,
      listen: false,
    );
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        _toggleFavourite(favouriteMovieController);
      },
      child: _favourite
          ? const Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : const Icon(
              Icons.favorite_border,
            ),
    );
  }
}
