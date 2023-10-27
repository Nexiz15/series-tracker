import 'package:floor/floor.dart';
import 'package:series_tracker/model/SeasonEntity.dart';
import 'package:series_tracker/model/SeriesEntity.dart';

@dao
abstract class SeasonDao {

  @Query('SELECT * FROM season')
  Future<List<SeasonEntity>> findAll();

  @insert
  Future<void> createSeason(SeasonEntity seasonEntity);

}