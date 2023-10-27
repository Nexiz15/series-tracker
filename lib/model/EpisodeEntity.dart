import 'package:floor/floor.dart';
import 'package:series_tracker/model/SeasonEntity.dart';

import 'SeriesEntity.dart';

@Entity(tableName: 'episode', foreignKeys: [
  ForeignKey(
      childColumns: ['season_id'], parentColumns: ['id'], entity: SeasonEntity)
])
class EpisodeEntity {
  @primaryKey
  final int? id;
  @ColumnInfo(name: 'season_id')
  final int seasonId;
  final bool watched;

  EpisodeEntity({required this.id, required this.seasonId, required this.watched});
}
