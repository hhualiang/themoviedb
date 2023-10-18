import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../../core/util/data_state.dart';
import '../../../core/util/ui_string.dart';

class MovieApiProvider {
  Client client;

  MovieApiProvider({
    required this.client,
  });

  Future<DataState<Map<String, dynamic>>> fetchMovieList(
    String category,
  ) async {
    try {
      final Response response = await client.get(
        Uri.parse(
          "${UiString.apiProviderUrl}$category${UiString.apiProviderAPIKey}",
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess<Map<String, dynamic>>(
          json.decode(response.body),
        );
      } else {
        return DataFailed<Map<String, dynamic>>(
          UiString.apiProviderFailedToLoadPost,
        );
      }
    } catch (e) {
      return DataFailed<Map<String, dynamic>>(
        e.toString(),
      );
    }
  }

  Future<DataState<dynamic>> fetchMovieGenres() async {
    try {
      final Response response = await client.get(
        Uri.parse(
          UiString.apiProviderGenresLink,
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess<dynamic>(
          response.body,
        );
      } else {
        return DataFailed<Map<String, dynamic>>(
          UiString.apiProviderFailedToLoadPost,
        );
      }
    } catch (e) {
      return DataFailed<Map<String, dynamic>>(
        e.toString(),
      );
    }
  }
}
