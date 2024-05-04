import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:series_tracker/config/constants.dart';

import '../../dataHolder/AddSeriesDataHolder.dart';

class SeriesAddSeasonsButton extends StatelessWidget {
  const SeriesAddSeasonsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context)?.addEpisodeSeasons ?? '',
            style:
            const TextStyle(fontSize: Constants.entryFontSize),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              color: Constants.inputBackgroundColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(Constants.defaultBorderRadius)),
            ),
            child: TextButton(
                onPressed: () =>
                    Provider.of<AddSeriesDataHolder>(context, listen: false)
                        .addSeason(AppLocalizations.of(context)?.addEpisodeSeason ?? ''),
                child: const FaIcon(
                  FontAwesomeIcons.plus,
                  color: Constants.primaryColor,
                )),
          ),
        ],
      ),
    );
  }
}
