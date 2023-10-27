import 'package:injectable/injectable.dart';
import 'package:series_tracker/config/database.dart';
import 'package:series_tracker/config/injectable.dart';
import 'package:series_tracker/dao/EpisodeDao.dart';
import 'package:series_tracker/dao/SeasonDao.dart';
import 'package:series_tracker/dao/SeriesOverviewProjection.dart';
import 'package:series_tracker/model/EpisodeEntity.dart';
import 'package:series_tracker/model/SeasonEntity.dart';
import 'package:series_tracker/model/SeriesEntity.dart';
import 'package:series_tracker/model/SeriesOverview.dart';
import 'package:series_tracker/dao/SeriesDao.dart';

import '../SeriesOverviewService.dart';

@Injectable(as: SeriesOverviewService)
class SeriesOverviewServiceImpl implements SeriesOverviewService {

  @override
  Future<List<SeriesOverview>> findAllSeries() async {
    SeriesDao seriesDao = await getIt.getAsync<SeriesDao>();
    SeasonDao seasonDao = await getIt.getAsync<SeasonDao>();
    EpisodeDao episodeDao = await getIt.getAsync<EpisodeDao>();

/*
    seriesDao.createSeries(SeriesEntity(id: null, name: 'Breaking Bad', created: DateTime.now()));
    seriesDao.createSeries(SeriesEntity(id: null, name: 'Haus des Geldes', created: DateTime.now()));
    seriesDao.createSeries(SeriesEntity(id: null, name: 'The Office', created: DateTime.now()));
    List<SeriesEntity> seriesEntities = await seriesDao.findAll2();

    seasonDao.createSeason(SeasonEntity(id: null, seriesId: seriesEntities[0].id!, name: '1'));
    seasonDao.createSeason(SeasonEntity(id: null, seriesId: seriesEntities[0].id!, name: '2'));
    seasonDao.createSeason(SeasonEntity(id: null, seriesId: seriesEntities[1].id!, name: '1'));
    seasonDao.createSeason(SeasonEntity(id: null, seriesId: seriesEntities[2].id!, name: '1'));
    List<SeasonEntity> seasonEntities = await seasonDao.findAll();

    episodeDao.createEpisode(EpisodeEntity(id: null, seasonId: seasonEntities[0].id!, watched: true));
    episodeDao.createEpisode(EpisodeEntity(id: null, seasonId: seasonEntities[0].id!, watched: true));
    episodeDao.createEpisode(EpisodeEntity(id: null, seasonId: seasonEntities[0].id!, watched: true));
    episodeDao.createEpisode(EpisodeEntity(id: null, seasonId: seasonEntities[1].id!, watched: true));
    episodeDao.createEpisode(EpisodeEntity(id: null, seasonId: seasonEntities[1].id!, watched: false));
    episodeDao.createEpisode(EpisodeEntity(id: null, seasonId: seasonEntities[3].id!, watched: true));
*/

    List<EpisodeEntity> episodes = await episodeDao.findAll();
    print(episodes[5].watched);
    print(episodes[5].seasonId);

    List<SeriesOverviewProjection> seriesEntities2 = await seriesDao.findAll();
    print(seriesEntities2[2].id);
    print(seriesEntities2[2].name);
    print(seriesEntities2[2].watchedEpisodes);
    print(seriesEntities2[2].totalEpisodes);
    return seriesEntities2
        .map(
            (e) => SeriesOverview(id: e.id, name: e.name, progressInPercent: e.totalEpisodes == 0 ? 0 : ((e.watchedEpisodes / e.totalEpisodes) * 100).toInt()))
        .toList();
  }
}
