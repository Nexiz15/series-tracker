import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/SeriesOverview.dart';

class SeriesOverviewStore extends ChangeNotifier {
  List<SeriesOverview> _series = [];

  UnmodifiableListView<SeriesOverview> get series {
    return UnmodifiableListView(_series);
  }

  void updateSeriesList(List<SeriesOverview> series) {
    _series = series;
    notifyListeners();
  }

  int get seriesCount {
    return _series.length;
  }

}