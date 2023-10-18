import 'dart:convert';

import 'package:floor/floor.dart';

class CategoryListConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> decode(String databaseValue) {
    final dynamic jsonFile = json.decode(databaseValue);
    return List<String>.from(jsonFile['category']);
  }

  @override
  String encode(List<String> value) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data.addAll(<String, dynamic>{'category': value});
    return json.encode(data);
  }
}
