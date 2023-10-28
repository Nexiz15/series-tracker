import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListSeriesTitle extends StatelessWidget {
  const ListSeriesTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 60.0, left: 10.0, bottom: 20.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)?.homeMySeries ?? '',
              style: const TextStyle(fontSize: 30.0),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: TextButton(
                  onPressed: () => {},
                  child: const FaIcon(
                    FontAwesomeIcons.plus,
                  )),
            )
          ],
        ));
  }
}
