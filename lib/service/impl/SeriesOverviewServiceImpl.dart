import 'package:injectable/injectable.dart';
import 'package:series_tracker/config/injectable.dart';
import 'package:series_tracker/dao/SeriesOverviewProjection.dart';
import 'package:series_tracker/model/SeriesOverview.dart';
import 'package:series_tracker/dao/SeriesDao.dart';

import '../SeriesOverviewService.dart';

@Injectable(as: SeriesOverviewService)
class SeriesOverviewServiceImpl implements SeriesOverviewService {
  SeriesDao seriesDao = getIt.get<SeriesDao>();

  @override
  Future<List<SeriesOverview>> findAllSeries() async {
    List<SeriesOverviewProjection> seriesEntities = await seriesDao.findAll();

    return seriesEntities
        .map((e) => SeriesOverview(
            id: e.id,
            name: e.name,
            progressInPercent:
                calculateProgress(e.watchedEpisodes, e.totalEpisodes)))
        .toList();
  }

  int calculateProgress(int watchedEpisodes, int totalEpisodes) {
    if (totalEpisodes == 0) {
      return 0;
    } else {
      return ((watchedEpisodes / totalEpisodes) * 100).toInt();
    }
  }
}
