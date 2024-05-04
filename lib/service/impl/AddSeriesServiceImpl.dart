import 'package:injectable/injectable.dart';
import 'package:series_tracker/config/injectable.dart';
import 'package:series_tracker/dao/EpisodeDao.dart';
import 'package:series_tracker/dao/SeasonDao.dart';
import 'package:series_tracker/dao/SeriesDao.dart';
import 'package:series_tracker/model/EpisodeEntity.dart';
import 'package:series_tracker/model/SeasonEntity.dart';
import 'package:series_tracker/model/SeriesEntity.dart';
import 'package:series_tracker/model/SeriesToAdd.dart';

import '../../model/SeasonToAdd.dart';
import '../AddSeriesService.dart';

@Injectable(as: AddSeriesService)
class AddSeriesServiceImpl implements AddSeriesService {
  SeriesDao seriesDao = getIt.get<SeriesDao>();
  SeasonDao seasonDao = getIt.get<SeasonDao>();
  EpisodeDao episodeDao = getIt.get<EpisodeDao>();

  @override
  Future<void> add(SeriesToAdd seriesToAdd) async {
    int seriesId = await seriesDao.createSeries(SeriesEntity(
        id: null, name: seriesToAdd.name, created: DateTime.now()));

    if (seriesToAdd.seasons.isNotEmpty) {
      // concurrency exception was thrown, even when using iterator
      List<SeasonToAdd> seasons = [];
      seasons.addAll(seriesToAdd.seasons);
      addSeasonsAndEpisodes(seasons, seriesId);
    }
  }

  Future<void> addSeasonsAndEpisodes(
      List<SeasonToAdd> seasonsToAdd, int seriesId) async {
    for (final season in seasonsToAdd) {
      int seasonId = await seasonDao.createSeason(
          SeasonEntity(id: null, seriesId: seriesId, name: season.name));
      addEpisodes(season.numberOfEpisodes, seasonId);
    }
  }

  Future<void> addEpisodes(int numberOfEpisodes, int seasonId) async {
    for (var i = 0; i < numberOfEpisodes; i++) {
      episodeDao.createEpisode(
          EpisodeEntity(id: null, seasonId: seasonId, watched: false));
    }
  }
}
