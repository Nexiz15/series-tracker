import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:series_tracker/model/SeasonToAdd.dart';

class AddSeriesDataHolder extends ChangeNotifier {
  String _name = '';
  final List<SeasonToAdd> _seasons = [];

  UnmodifiableListView<SeasonToAdd> get seasons {
    return UnmodifiableListView(_seasons);
  }

  int get seasonsCount {
    return _seasons.length;
  }

  void addSeason(SeasonToAdd season) {
    _seasons.add(season);
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
  }

  String get name {
    return _name;
  }

}