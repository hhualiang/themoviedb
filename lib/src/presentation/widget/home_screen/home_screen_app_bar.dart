import 'package:flutter/material.dart';

import '../../../../src/core/util/ui_string.dart';

class HomeScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  static const double _preferredSize = 130;

  const HomeScreenAppBar({
    super.key,
    required this.pageController,
    required this.tabController,
  });

  final TabController tabController;
  final PageController pageController;

  @override
  Size get preferredSize => const Size.fromHeight(_preferredSize);

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text(
        UiString.appTitle,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      flexibleSpace: Row(
        children: [
          const SizedBox(
            width: 250,
            height: 100,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      bottom: TabBar(
        labelColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) => Colors.black,
        ),
        indicatorColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) => Colors.black,
        ),
        dividerColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) => Colors.black,
        ),
        controller: widget.tabController,
        tabs: const <Widget>[
          Tab(
            text: (UiString.homeScreenCategoryPopular),
            icon: Icon(
              Icons.star,
              color: Colors.black,
            ),
          ),
          Tab(
            text: (UiString.homeScreenPlayNow),
            icon: Icon(Icons.play_circle),
          ),
          Tab(
            text: (UiString.homeScreenCategoryTopRated),
            icon: Icon(Icons.rate_review),
          ),
          Tab(
            text: (UiString.homeScreenCategoryUpcoming),
            icon: Icon(Icons.upcoming),
          ),
        ],
        onTap: (int int) {
          widget.pageController.jumpToPage(widget.tabController.index);
        },
      ),
    );
  }
}
