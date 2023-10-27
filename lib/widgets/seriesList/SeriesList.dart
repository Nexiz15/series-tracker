import 'package:flutter/material.dart';
import 'package:series_tracker/model/SeriesOverview.dart';
import 'package:provider/provider.dart';
import 'package:series_tracker/service/SeriesOverviewService.dart';
import 'package:series_tracker/store/SeriesOverviewStore.dart';
import 'package:series_tracker/widgets/seriesList/SeriesListEntry.dart';

import '../../config/injectable.dart';

class SeriesList extends StatefulWidget {
  const SeriesList({super.key});

  @override
  State<SeriesList> createState() => _SeriesListState();
}

class _SeriesListState extends State<SeriesList> {

  SeriesOverviewService seriesOverviewService = getIt.get();
  List<SeriesOverview> series = List.empty();

  @override
  void initState() {
    super.initState();
    seriesOverviewService.findAllSeries();
    // TODO call db and set store
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Consumer<SeriesOverviewStore>(
            builder: (context, seriesOverviewStore, child) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 20),
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final series = seriesOverviewStore.series[index];
                    return SeriesListEntry(series: series);
                  },
                itemCount: seriesOverviewStore.seriesCount,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
              );
            },
          ),
    );
  }
}

