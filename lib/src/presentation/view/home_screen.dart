import 'package:flutter/material.dart';

import '../../core/util/enum_classes.dart';
import '../../domain/entity/movie.dart';
import '../widget/drawer/app_drawer.dart';
import '../widget/home_screen/home_screen_app_bar.dart';
import 'movie_list_by_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Future<List<Movie>> movieList;

  late final PageController pageController;

  late final TabController tabController;

  void onPageChanged(int index) {
    tabController.animateTo(index);
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: Pages.values.length,
      vsync: this,
    );
    pageController = PageController();
  }

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(
        pageController: pageController,
        tabController: tabController,
      ),
      drawer: const AppDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            for (Pages pages in Pages.values)
              MoviesByCategory(
                category: pages.pageName.toLowerCase().replaceAll(' ', '_'),
              ),
          ],
          onPageChanged: (int page) {
            tabController.animateTo(page);
          },
        ),
      ),
    );
  }
}
