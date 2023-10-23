import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const SeriesTracker());
}

class SeriesTracker extends StatelessWidget {
  const SeriesTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      home: HomeTitle());
  }
}
class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Container(
          child: Text(AppLocalizations.of(context)!.homeMySeries),
        ),
      ),
    );
  }
}
