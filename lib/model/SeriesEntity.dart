import 'package:floor/floor.dart';

@Entity(tableName: 'series')
class SeriesEntity {
  @primaryKey
  final int? id;
  final String name;
  final DateTime created;

  SeriesEntity({required this.id, required this.name, required this.created});
}