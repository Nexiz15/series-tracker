import 'package:flutter/material.dart';
import 'package:series_tracker/widgets/seriesList/SeriesList.dart';
import '../config/constants.dart';
import '../widgets/seriesList/SearchField.dart';
import '../widgets/seriesList/SeriesListTitle.dart';

class SeriesListScreen extends StatelessWidget {
  const SeriesListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListSeriesTitle(),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20.0),
                decoration: const BoxDecoration(
                  color: Constants.secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Constants.defaultBorderRadius),
                    topRight: Radius.circular(Constants.defaultBorderRadius),
                  ),
                ),
                child: const Column(
                  children: [
                    SearchField(),
                    SeriesList(),
                  ],
                )
              ),
            ),
          ],
        ));
  }
}
