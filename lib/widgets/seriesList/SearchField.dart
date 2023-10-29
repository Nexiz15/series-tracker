import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: Constants.defaultScreenBorderPadding, right: Constants.defaultScreenBorderPadding),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.defaultBorderRadius),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade300,
          isDense: true,
          hintText: AppLocalizations.of(context)?.homeSearchButtonPlaceholder ?? '',
        ),
      ),
    );
  }
}