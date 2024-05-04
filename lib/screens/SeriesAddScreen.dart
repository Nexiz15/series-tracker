import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/constants.dart';
import '../dataHolder/AddSeriesDataHolder.dart';
import '../model/SeasonToAdd.dart';
import '../widgets/seriesAdd/SeriesAddName.dart';
import '../widgets/seriesAdd/SeriesAddSeasonButton.dart';
import '../widgets/seriesAdd/SeriesAddSeasons.dart';
import '../widgets/seriesAdd/SeriesAddTitle.dart';

class SeriesAddScreen extends StatefulWidget {
  const SeriesAddScreen({super.key});

  @override
  State<SeriesAddScreen> createState() => _SeriesAddScreenState();
}

class _SeriesAddScreenState extends State<SeriesAddScreen> {
  String seriesName = '';
  List<SeasonToAdd> seasons = [];

  @override
  void initState() {
    super.initState();
    Provider.of<AddSeriesDataHolder>(context, listen: false).clearDataHolder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SeriesAddTitle(),
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
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: Constants.defaultScreenBorderPadding,
                          right: Constants.defaultScreenBorderPadding),
                      child: const Column(
                        children: [
                          SeriesAddName(),
                          SeriesAddSeasonsButton(),
                          SeriesAddSeason(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
