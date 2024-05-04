import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:series_tracker/config/constants.dart';
import 'package:series_tracker/model/SeriesToAdd.dart';
import 'package:series_tracker/service/AddSeriesService.dart';

import '../../config/injectable.dart';
import '../../config/routes.dart';
import '../../dataHolder/AddSeriesDataHolder.dart';

class SeriesAddTitle extends StatefulWidget {
  const SeriesAddTitle({super.key});

  @override
  State<SeriesAddTitle> createState() => _SeriesAddTitleState();
}

class _SeriesAddTitleState extends State<SeriesAddTitle> {
  AddSeriesService addSeriesService = getIt.get();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
            top: 60.0,
            left: Constants.defaultScreenBorderPadding,
            bottom: 20.0,
            right: Constants.defaultScreenBorderPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)?.addAddSeries ?? '',
              style: const TextStyle(fontSize: Constants.titleFontSize),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Constants.secondaryColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(Constants.defaultBorderRadius)),
              ),
              child: TextButton(
                  onPressed: () => saveSeries(),
                  child: const FaIcon(
                    FontAwesomeIcons.check,
                    color: Constants.primaryColor,
                  )),
            )
          ],
        ));
  }

  void saveSeries() async {
    AddSeriesDataHolder addSeriesDataHolder =
        Provider.of<AddSeriesDataHolder>(context, listen: false);

    if (addSeriesDataHolder.name.isEmpty) {
      showNameIsEmptyDialog();
    } else {
      await addSeriesService.add(SeriesToAdd(
          name: addSeriesDataHolder.name,
          seasons: addSeriesDataHolder.seasons));
      addSeriesDataHolder.clearDataHolder();
      navigateToHome();
    }
  }

  void showNameIsEmptyDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                AppLocalizations.of(context)?.addSeriesNameEmptyDialogTitle ??
                    ''),
            content: Text(
                AppLocalizations.of(context)?.addSeriesNameEmptyDialogContent ??
                    ''),
            actions: <Widget>[
              TextButton(
                child: Text(AppLocalizations.of(context)?.close ?? ''),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void navigateToHome() {
    Navigator.pushNamed(context, Routes.seriesListScreenPath);
  }
}
