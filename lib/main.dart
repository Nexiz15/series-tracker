import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:series_tracker/config/constants.dart';
import 'package:series_tracker/dataHolder/AddSeriesDataHolder.dart';
import 'package:series_tracker/dataHolder/SeriesOverviewDataHolder.dart';
import 'package:series_tracker/screens/LoadingScreen.dart';
import 'package:series_tracker/screens/SeriesListScreen.dart';

import 'config/injectable.dart';
import 'config/routes.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SeriesOverviewDataHolder>(
          create: (_) => SeriesOverviewDataHolder(),
        ),
        ChangeNotifierProvider<AddSeriesDataHolder>(
          create: (_) => AddSeriesDataHolder(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: Constants.showDebugBanner,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: Routes.defineRoutes(),
        home: initialScreen(),
      ),
    );
  }

  Widget initialScreen() {
    return FutureBuilder(
      future: GetIt.instance.allReady(timeout: const Duration(seconds: 3)),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return const SeriesListScreen();
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
