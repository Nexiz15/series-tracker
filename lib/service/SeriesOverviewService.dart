import 'package:series_tracker/model/SeriesOverview.dart';

abstract class SeriesOverviewService {
  Future<List<SeriesOverview>> findAllSeries();
}