import 'package:floor/floor.dart';

class DateTimeConverter extends TypeConverter<DateTime, String> {

  @override
  DateTime decode(String dateTime) {
    return DateTime.parse(dateTime);
  }

  @override
  String encode(DateTime dateTime) {
    return dateTime.toIso8601String();
  }
}