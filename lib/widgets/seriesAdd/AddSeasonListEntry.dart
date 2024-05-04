import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:series_tracker/config/constants.dart';
import 'package:series_tracker/model/SeasonToAdd.dart';

class AddSeasonListEntry extends StatelessWidget {
  final SeasonToAdd season;

  const AddSeasonListEntry({super.key, required this.season});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.defaultScreenBorderPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Constants.defaultBorderRadius),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Constants.inputBackgroundColor,
                    isDense: true,
                  ),
                  controller: TextEditingController()..text = season.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
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
                    controller: TextEditingController()
                      ..text = season.numberOfEpisodes.toString(),
                    keyboardType: TextInputType.number,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
