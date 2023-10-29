import 'package:flutter/material.dart';
import 'package:series_tracker/model/SeriesOverview.dart';
import 'package:provider/provider.dart';
import 'package:series_tracker/service/SeriesOverviewService.dart';
import 'package:series_tracker/dataHolder/SeriesOverviewDataHolder.dart';
import 'package:series_tracker/widgets/seriesList/SeriesListEntry.dart';

import '../../config/injectable.dart';

class SeriesList extends StatefulWidget {
  const SeriesList({super.key});

  @override
  State<SeriesList> createState() => _SeriesListState();
}

class _SeriesListState extends State<SeriesList> {

  SeriesOverviewService seriesOverviewService = getIt.get();

  @override
  void initState() {
    super.initState();
    loadSeries();
  }

  void loadSeries() async {
      List<SeriesOverview> series = await seriesOverviewService.findAllSeries();
      if (mounted) {
        Provider.of<SeriesOverviewDataHolder>(context, listen: false).setSeriesList(series);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Consumer<SeriesOverviewDataHolder>(
            builder: (context, seriesOverviewDataHolder, child) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 20),
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final series = seriesOverviewDataHolder.series[index];
                    return SeriesListEntry(series: series);
                  },
                itemCount: seriesOverviewDataHolder.seriesCount,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
              );
            },
          ),
    );
  }
}


