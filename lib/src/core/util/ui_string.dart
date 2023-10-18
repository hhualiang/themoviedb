abstract class UiString {
  //App Title
  static const String appTitle = 'Movie Database';

  //photoUrl
  static const String movieURL = 'https://image.tmdb.org/t/p/w500/';

  //Home Screen
  static const String homeScreenCategoryPopular = 'Popular';
  static const String homeScreenCategoryNowPlaying = 'Now Playing';
  static const String homeScreenCategoryTopRated = 'Top Rated';
  static const String homeScreenCategoryUpcoming = 'Upcoming';

  static const String homeScreenPlayNow = 'Play Now';

  //API PROVIDER
  static const String apiProviderUrl = 'http://api.themoviedb.org/3/movie/';
  static const String apiProviderAPIKey = '?api_key=$apiProviderKey';
  static const String apiProviderKey = '447e725503a582e83ecf9a7a50bc9729';
  static const String apiProviderGenresLink =
      'https://api.themoviedb.org/3/genre/movie/list?language=en&api_key=$apiProviderKey';
  static const String apiProviderFailedToLoadPost = 'Failed to load post';

  //App Route
  static const String routeError = 'Error';

  //error image
  static const String errorImagePath = 'lib/assets/no_image_found.png';
  static const String errorImageText = 'Could not load image...';
}
