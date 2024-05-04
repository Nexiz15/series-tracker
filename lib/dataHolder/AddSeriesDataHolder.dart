import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  void addSeason(String seasonBaseName) {
    int seasonNameCount = _seasons.length + 1;
    String seasonName = "$seasonBaseName $seasonNameCount";
    _seasons.add(SeasonToAdd(name: seasonName, numberOfEpisodes: 1));
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
  }

  String get name {
    return _name;
  }

  void clearDataHolder() {
    _name = '';
    _seasons.clear();
  }
}