import 'ui_string.dart';

enum CounterAction {
  load,
  increment,
}

enum BaseState {
  loading,
  success,
  failure,
  empty,
}

enum Pages {
  popular(
    0,
    UiString.homeScreenCategoryPopular,
  ),
  nowPlaying(
    1,
    UiString.homeScreenCategoryNowPlaying,
  ),
  topRated(
    2,
    UiString.homeScreenCategoryTopRated,
  ),
  upcoming(
    3,
    UiString.homeScreenCategoryUpcoming,
  );

  const Pages(
    this.pageIndex,
    this.pageName,
  );

  final int pageIndex;
  final String pageName;
}
