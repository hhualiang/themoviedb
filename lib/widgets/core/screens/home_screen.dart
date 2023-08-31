import 'package:flutter/material.dart';

import '../../../repository/local_repository.dart';
import '../../../repository/movie_data_class.dart';
import 'home_screen_files/home_screen_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<MovieFile>> movieList;

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
        child: FutureBuilder<List<MovieFile>>(
          future: movieList,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<MovieFile>> snapshot,
          ) {
            if (snapshot.hasData) {
              return MovieRowListView(movieList: snapshot.data ?? []);
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
