import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:series_tracker/config/constants.dart';

import '../../dataHolder/AddSeriesDataHolder.dart';

class SeriesAddName extends StatelessWidget {
  const SeriesAddName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)?.addEpisodeName ?? '',
          style:
          const TextStyle(fontSize: Constants.entryFontSize),
        ),
        Container(
          padding: const EdgeInsets.all(
              Constants.defaultScreenBorderPadding),
          child: SizedBox(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      Constants.defaultBorderRadius),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Constants.inputBackgroundColor,
                isDense: true,
              ),
              onChanged: (e) => Provider.of<AddSeriesDataHolder>(context, listen: false).setName(e),
            ),
          ),
        ),
      ],
    );
  }
}
