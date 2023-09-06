import 'package:flutter/material.dart';

import '../../data/repository/local_repository.dart';
import '../../domain/entity/movie.dart';
import '../widget/home_screen/home_screen_app_bar.dart';
import '../widget/home_screen/home_screen_movie_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> movieList;

  @override
  void initState() {
    super.initState();
    LocalRepository movieRepository = LocalRepository();
    movieList = movieRepository.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: FutureBuilder<List<Movie>>(
          future: movieList,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Movie>> snapshot,
          ) {
            if (snapshot.hasData) {
              return MovieRowListView(
                movieList: snapshot.data ?? <Movie>[],
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
    );
  }
}
