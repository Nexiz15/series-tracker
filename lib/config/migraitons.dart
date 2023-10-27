import 'package:floor/floor.dart';

final migration0to1 = Migration(0, 1, (database) async {
  await database.execute('CREATE TABLE series (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name VARCHAR(255) NOT NULL, created VARCHAR(255) NOT NULL)');
  await database.execute('CREATE TABLE season (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name VARCHAR(255), series_id INTEGER NOT NULL, FOREIGN KEY(series_id) REFERENCES series(id));');
  await database.execute('CREATE TABLE episode (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, watched BIT NOT NULL, season_id INTEGER NOT NULL, FOREIGN KEY(season_id) REFERENCES season(id));');
  await database.execute(' SELECT series_outer.id AS id, series_outer.name AS name, '
      'COUNT(episode.id) AS watchedEpisodes, '
  '(SELECT COUNT(episode.id) FROM series '
  'LEFT JOIN season ON series.id = season.series_id '
  'LEFT JOIN episode ON season.id = episode.season_id '
  'WHERE series.id = series_outer.id '
  'GROUP BY series.id) AS totalEpisodes '
  'FROM series series_outer '
  'LEFT JOIN season ON series_outer.id = season.series_id '
  'LEFT JOIN episode ON season.id = episode.season_id AND episode.watched = 1 '
  'GROUP BY series_outer.id;'
  );
});