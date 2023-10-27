// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SeriesDao? _seriesDaoInstance;

  SeasonDao? _seasonDaoInstance;

  EpisodeDao? _episodeDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `series` (`id` INTEGER, `name` TEXT NOT NULL, `created` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `season` (`id` INTEGER, `series_id` INTEGER NOT NULL, `name` TEXT NOT NULL, FOREIGN KEY (`series_id`) REFERENCES `series` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `episode` (`id` INTEGER, `season_id` INTEGER NOT NULL, `watched` INTEGER NOT NULL, FOREIGN KEY (`season_id`) REFERENCES `season` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');

        await database.execute(
            'CREATE VIEW IF NOT EXISTS `series_overview_projection` AS  SELECT series_outer.id AS id, series_outer.name AS name, COUNT(episode.id) AS watchedEpisodes, (SELECT COUNT(episode.id) FROM series LEFT JOIN season ON series.id = season.series_id LEFT JOIN episode ON season.id = episode.season_id WHERE series.id = series_outer.id GROUP BY series.id) AS totalEpisodes FROM series series_outer LEFT JOIN season ON series_outer.id = season.series_id LEFT JOIN episode ON season.id = episode.season_id AND episode.watched = 1 GROUP BY series_outer.id;');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SeriesDao get seriesDao {
    return _seriesDaoInstance ??= _$SeriesDao(database, changeListener);
  }

  @override
  SeasonDao get seasonDao {
    return _seasonDaoInstance ??= _$SeasonDao(database, changeListener);
  }

  @override
  EpisodeDao get episodeDao {
    return _episodeDaoInstance ??= _$EpisodeDao(database, changeListener);
  }
}

class _$SeriesDao extends SeriesDao {
  _$SeriesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _seriesEntityInsertionAdapter = InsertionAdapter(
            database,
            'series',
            (SeriesEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'created': _dateTimeConverter.encode(item.created)
                }),
        _seriesEntityDeletionAdapter = DeletionAdapter(
            database,
            'series',
            ['id'],
            (SeriesEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'created': _dateTimeConverter.encode(item.created)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SeriesEntity> _seriesEntityInsertionAdapter;

  final DeletionAdapter<SeriesEntity> _seriesEntityDeletionAdapter;

  @override
  Future<List<SeriesOverviewProjection>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM series_overview_projection',
        mapper: (Map<String, Object?> row) => SeriesOverviewProjection(
            row['id'] as int,
            row['name'] as String,
            row['watchedEpisodes'] as int,
            row['totalEpisodes'] as int));
  }

  @override
  Future<List<SeriesEntity>> findAll2() async {
    return _queryAdapter.queryList('SELECT * FROM series',
        mapper: (Map<String, Object?> row) => SeriesEntity(
            id: row['id'] as int?,
            name: row['name'] as String,
            created: _dateTimeConverter.decode(row['created'] as String)));
  }

  @override
  Future<void> createSeries(SeriesEntity seriesEntity) async {
    await _seriesEntityInsertionAdapter.insert(
        seriesEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSeries(List<SeriesEntity> seriesEntity) async {
    await _seriesEntityDeletionAdapter.deleteList(seriesEntity);
  }
}

class _$SeasonDao extends SeasonDao {
  _$SeasonDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _seasonEntityInsertionAdapter = InsertionAdapter(
            database,
            'season',
            (SeasonEntity item) => <String, Object?>{
                  'id': item.id,
                  'series_id': item.seriesId,
                  'name': item.name
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SeasonEntity> _seasonEntityInsertionAdapter;

  @override
  Future<List<SeasonEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM season',
        mapper: (Map<String, Object?> row) => SeasonEntity(
            id: row['id'] as int?,
            seriesId: row['series_id'] as int,
            name: row['name'] as String));
  }

  @override
  Future<void> createSeason(SeasonEntity seasonEntity) async {
    await _seasonEntityInsertionAdapter.insert(
        seasonEntity, OnConflictStrategy.abort);
  }
}

class _$EpisodeDao extends EpisodeDao {
  _$EpisodeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _episodeEntityInsertionAdapter = InsertionAdapter(
            database,
            'episode',
            (EpisodeEntity item) => <String, Object?>{
                  'id': item.id,
                  'season_id': item.seasonId,
                  'watched': item.watched ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EpisodeEntity> _episodeEntityInsertionAdapter;

  @override
  Future<List<EpisodeEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM episode',
        mapper: (Map<String, Object?> row) => EpisodeEntity(
            id: row['id'] as int?,
            seasonId: row['season_id'] as int,
            watched: (row['watched'] as int) != 0));
  }

  @override
  Future<void> createEpisode(EpisodeEntity episodeEntity) async {
    await _episodeEntityInsertionAdapter.insert(
        episodeEntity, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
