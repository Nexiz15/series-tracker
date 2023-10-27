import 'package:floor/floor.dart';
import 'package:series_tracker/model/EpisodeEntity.dart';
import 'package:series_tracker/model/SeasonEntity.dart';
import 'package:series_tracker/model/SeriesEntity.dart';

@dao
abstract class EpisodeDao {

  @Query('SELECT * FROM episode')
  Future<List<EpisodeEntity>> findAll();

  @insert
  Future<void> createEpisode(EpisodeEntity episodeEntity);

}