import 'package:floor/floor.dart';
import 'package:series_tracker/model/SeasonEntity.dart';

@dao
abstract class SeasonDao {

  @Query('SELECT * FROM season')
  Future<List<SeasonEntity>> findAll();

  @insert
  Future<int> createSeason(SeasonEntity seasonEntity);
}