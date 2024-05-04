import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:series_tracker/widgets/seriesAdd/AddSeasonListEntry.dart';

import '../../dataHolder/AddSeriesDataHolder.dart';

class SeriesAddSeason extends StatelessWidget {
  const SeriesAddSeason({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddSeriesDataHolder>(
        builder: (context, addSeriesDataHolder, child) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 20),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final season = addSeriesDataHolder.seasons[index];
              return AddSeasonListEntry(season: season);
            },
            itemCount: addSeriesDataHolder.seasonsCount,
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
          );
        },
    );
  }
}
