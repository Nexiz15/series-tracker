import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:series_tracker/config/constants.dart';
import 'package:series_tracker/config/routes.dart';
import 'package:series_tracker/model/SeriesOverview.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const int maxPercent = 100;

class SeriesListEntry extends StatelessWidget {
  final SeriesOverview series;

  const SeriesListEntry({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.seriesEditScreenPath,
        arguments: series.id
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(Constants.defaultScreenBorderPadding),
                child: getIcon(series.progressInPercent),
              ),
              Text(
                series.name,
                style: const TextStyle(fontSize: Constants.listEntryFontSize),
              ),
            ],
          ),
          LinearProgressBar(
            maxSteps: maxPercent,
            progressType:
                LinearProgressBar.progressTypeLinear, // Use Linear progress
            currentStep: series.progressInPercent,
            progressColor: getProgressColor(series.progressInPercent),
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  FaIcon getIcon(int progressInPercent) {
    if (progressInPercent == maxPercent) {
      return const FaIcon(FontAwesomeIcons.flagCheckered);
    } else {
      return const FaIcon(FontAwesomeIcons.tv);
    }
  }

  Color getProgressColor(int progressInPercent) {
    if (progressInPercent == maxPercent) {
      return Constants.finishedColor;
    } else {
      return Constants.onGoingColor;
    }
  }
}
