import 'package:flutter/material.dart';

import '../../../core/util/local_push_notification.dart';
import '../../../domain/entity/fav_movie.dart';

class FavouriteButton extends StatefulWidget {
  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();

  final int movieId;

  FavouriteButton({super.key,
    required this.movieId,
  });
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool _favourite = false;

  void _toggleFavourite() {
    setState(() {
      _favourite = !_favourite;
    });
    if (_favourite) {
      LocalPushNotificationPlugin().showNotification(
        title: 'Agregado a favoritos',
        body: 'La pelicula se agrego a tu lista de favoritos',
      );
      FavouriteMovie ins = FavouriteMovie(widget.movieId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: _toggleFavourite,
      child: _favourite
          ? const Icon(Icons.favorite, color: Colors.red)
          : const Icon(Icons.favorite_border),
    );
  }
}
