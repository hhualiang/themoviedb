import 'ui_text.dart';

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
    UiText.homeScreenCategoryPopular,
  ),
  nowPlaying(
    1,
    UiText.homeScreenCategoryNowPlaying,
  ),
  topRated(
    2,
    UiText.homeScreenCategoryTopRated,
  ),
  upcoming(
    3,
    UiText.homeScreenCategoryUpcoming,
  );

  const Pages(
    this.pageIndex,
    this.pageName,
  );

  final int pageIndex;
  final String pageName;
}
