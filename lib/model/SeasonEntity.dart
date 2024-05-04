import 'package:floor/floor.dart';

import 'SeriesEntity.dart';

@Entity(tableName: 'season', foreignKeys: [
  ForeignKey(
      childColumns: ['series_id'], parentColumns: ['id'], entity: SeriesEntity)
])
class SeasonEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  @ColumnInfo(name: 'series_id')
  final int seriesId;
  final String name;

  SeasonEntity({required this.id, required this.seriesId, required this.name});
}
