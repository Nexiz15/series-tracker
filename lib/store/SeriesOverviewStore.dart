import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/SeriesOverview.dart';

class SeriesOverviewStore extends ChangeNotifier {
  List<SeriesOverview> _series = [
    SeriesOverview(id: 1, name: "Breaking Bad", progressInPercent: 67),
    SeriesOverview(id: 2, name: "Haus des Geldes", progressInPercent: 33),
    SeriesOverview(id: 3, name: "The Office", progressInPercent: 100),
  ];

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