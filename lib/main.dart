import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:series_tracker/config/constants.dart';
import 'package:series_tracker/screens/LoadingScreen.dart';
import 'package:series_tracker/screens/SeriesListScreen.dart';
import 'package:series_tracker/store/SeriesOverviewStore.dart';

import 'config/injectable.dart';

void main() {
  configureDependencies();
  setAppOrientation();
  runApp(const SeriesTracker());
}

void setAppOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class SeriesTracker extends StatelessWidget {
  const SeriesTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SeriesOverviewStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: Constants.showDebugBanner,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: FutureBuilder(
            future:
                GetIt.instance.allReady(timeout: const Duration(seconds: 3)),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return const SeriesListScreen();
              } else {
                return const LoadingScreen();
              }
            }),
      ),
    );
  }
}
