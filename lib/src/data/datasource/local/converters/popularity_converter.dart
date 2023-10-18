import 'package:floor/floor.dart';

class PopularityConverter extends TypeConverter<num, String> {
  @override
  num decode(String databaseValue) {
    return num.parse(databaseValue);
  }

  @override
  String encode(num value) {
    return value.toString();
  }
}
