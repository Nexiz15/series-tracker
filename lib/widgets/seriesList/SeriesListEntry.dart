import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:series_tracker/model/SeriesOverview.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SeriesListEntry extends StatelessWidget {
  final SeriesOverview series;

  const SeriesListEntry({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: getIcon(series.progressInPercent),
            ),
            Text(
              series.name,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
        LinearProgressBar(
          maxSteps: 100,
          progressType:
              LinearProgressBar.progressTypeLinear, // Use Linear progress
          currentStep: series.progressInPercent,
          progressColor: getProgressColor(series.progressInPercent),
          backgroundColor: Colors.grey,
        ),
      ],
    );
  }

  FaIcon getIcon(int progressInPercent) {
    if (progressInPercent == 100) {
      return const FaIcon(FontAwesomeIcons.flagCheckered);
    } else {
      return const FaIcon(FontAwesomeIcons.tv);
    }
  }

  Color getProgressColor(int progressInPercent) {
    if (progressInPercent == 100) {
      return Colors.green;
    } else {
      return Colors.purple;
    }
  }
}
