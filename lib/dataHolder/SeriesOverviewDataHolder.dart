import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/SeriesOverview.dart';

class SeriesOverviewDataHolder extends ChangeNotifier {
  List<SeriesOverview> _series = [];
  String _searchText = '';

  UnmodifiableListView<SeriesOverview> get series {
    return UnmodifiableListView(_series.filterSeries(_searchText));
  }

  int get seriesCount {
    return _series.filterSeries(_searchText).length;
  }

  void setSeriesList(List<SeriesOverview> series) {
    _series = series;
    notifyListeners();
  }

  void setSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

}

extension SeriesListExtension on List<SeriesOverview> {
  List<SeriesOverview> filterSeries(String searchText) {
    return where((e) => e.name.toLowerCase().contains(searchText)).toList();
  }
}