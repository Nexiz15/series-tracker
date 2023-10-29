import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:series_tracker/config/constants.dart';

class ListSeriesTitle extends StatelessWidget {
  const ListSeriesTitle({super.key});

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
              AppLocalizations.of(context)?.homeMySeries ?? '',
              style: const TextStyle(fontSize: Constants.titleFontSize),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Constants.secondaryColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(Constants.defaultBorderRadius)),
              ),
              child: TextButton(
                  onPressed: () => {},
                  child: const FaIcon(
                    FontAwesomeIcons.plus,
                    color: Constants.primaryColor,
                  )),
            )
          ],
        ));
  }
}
