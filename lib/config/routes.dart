import 'package:flutter/cupertino.dart';

import '../screens/SeriesEditScreen.dart';
import '../screens/SeriesListScreen.dart';

class Routes {
  static const seriesListScreenPath = '/list-series';
  static const seriesEditScreenPath = '/edit-series';

  static Map<String, WidgetBuilder> defineRoutes() {
    return {
      seriesListScreenPath: (context) => const SeriesListScreen(),
      seriesEditScreenPath: (context) => const SeriesEditScreen(),
    };
  }
}