import 'package:series_tracker/model/SeriesOverview.dart';

abstract class SeriesOverviewService {
  List<SeriesOverview> findAllSeries();
}