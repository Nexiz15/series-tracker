import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:series_tracker/screens/SeriesListScreen.dart';
import 'package:series_tracker/store/SeriesOverviewStore.dart';

import 'config/injectable.dart';

void main() {
  configureDependencies();
  runApp(const SeriesTracker());
}

class SeriesTracker extends StatelessWidget {
  const SeriesTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SeriesOverviewStore(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: SeriesListScreen(),
      ),
    );
  }
}
