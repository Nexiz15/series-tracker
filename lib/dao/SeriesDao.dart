import 'package:floor/floor.dart';
import 'package:series_tracker/dao/SeriesOverviewProjection.dart';
import 'package:series_tracker/model/SeriesEntity.dart';

import 'SeriesOverviewProjection.dart';

@dao
abstract class SeriesDao {

  @Query('SELECT * FROM series_overview_projection')
  Future<List<SeriesOverviewProjection>> findAll();

  @Query('SELECT * FROM series')
  Future<List<SeriesEntity>> findAll2();

  @insert
  Future<void> createSeries(SeriesEntity seriesEntity);

  @delete
  Future<void> deleteSeries(List<SeriesEntity> seriesEntity);

}