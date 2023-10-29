import 'dart:async';

import 'package:floor/floor.dart';
import 'package:series_tracker/converters/DateTimeConverter.dart';
import 'package:series_tracker/dao/SeriesOverviewProjection.dart';
import 'package:series_tracker/model/EpisodeEntity.dart';
import 'package:series_tracker/model/SeasonEntity.dart';
import 'package:series_tracker/model/SeriesEntity.dart';
import 'package:series_tracker/dao/SeriesDao.dart';
import 'package:series_tracker/dao/SeasonDao.dart';
import 'package:series_tracker/dao/EpisodeDao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [SeriesEntity, SeasonEntity, EpisodeEntity], views: [SeriesOverviewProjection])
@TypeConverters([DateTimeConverter])
abstract class AppDatabase extends FloorDatabase {
  static String appDatabaseName = 'series_tracker.db';
  SeriesDao get seriesDao;
  SeasonDao get seasonDao;
  EpisodeDao get episodeDao;
}
