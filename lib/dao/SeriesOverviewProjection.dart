import 'package:floor/floor.dart';

@DatabaseView(' SELECT series_outer.id AS id, series_outer.name AS name, '
    'COUNT(episode.id) AS watchedEpisodes, '
    '(SELECT COUNT(episode.id) FROM series '
    'LEFT JOIN season ON series.id = season.series_id '
    'LEFT JOIN episode ON season.id = episode.season_id '
    'WHERE series.id = series_outer.id '
    'GROUP BY series.id) AS totalEpisodes '
    'FROM series series_outer '
    'LEFT JOIN season ON series_outer.id = season.series_id '
    'LEFT JOIN episode ON season.id = episode.season_id AND episode.watched = 1 '
    'GROUP BY series_outer.id;', viewName: 'series_overview_projection')
class SeriesOverviewProjection {
  final int id;
  final String name;
  final int watchedEpisodes;
  final int totalEpisodes;

  SeriesOverviewProjection(this.id, this.name, this.watchedEpisodes, this.totalEpisodes);
}