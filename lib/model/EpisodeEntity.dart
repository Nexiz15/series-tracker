import 'package:floor/floor.dart';
import 'package:series_tracker/model/SeasonEntity.dart';

@Entity(tableName: 'episode', foreignKeys: [
  ForeignKey(
      childColumns: ['season_id'], parentColumns: ['id'], entity: SeasonEntity)
])
class EpisodeEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  @ColumnInfo(name: 'season_id')
  final int seasonId;
  final bool watched;

  EpisodeEntity({required this.id, required this.seasonId, required this.watched});
}
