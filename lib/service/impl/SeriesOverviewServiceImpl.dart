import 'package:injectable/injectable.dart';
import 'package:series_tracker/model/SeriesOverview.dart';

import '../SeriesOverviewService.dart';

@Injectable(as: SeriesOverviewService)
class SeriesOverviewServiceImpl implements SeriesOverviewService {

  @override
  List<SeriesOverview> findAllSeries() {
    print('accessed');
    return [];
  }

}