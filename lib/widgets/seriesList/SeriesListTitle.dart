import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class ListSeriesTitle extends StatelessWidget {
  const ListSeriesTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60.0, left: 10.0, bottom: 20.0),
      child: Text(
        AppLocalizations.of(context)?.homeMySeries ?? '',
        style: const TextStyle(fontSize: 30.0),
      ),
    );
  }
}
