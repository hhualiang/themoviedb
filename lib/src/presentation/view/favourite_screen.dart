import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/fav_movie_controller.dart';
import '../widget/home_screen/home_screen_movies_stream_builder.dart';
import '../widget/upcoming_alert_dialog.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  static const String _appBarTitle = 'My favourite movies';

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late FavouriteMovieController movieController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieController = Provider.of<FavouriteMovieController>(context);
    movieController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          FavouritePage._appBarTitle,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              ShowUpcomingAlertDialog.showAlertDialog(
                context,
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: MovieStreamBuilder(
          stream: movieController.moviesStream,
        ),
      ),
    );
  }
}
