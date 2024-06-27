import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harry_potter/data/data.dart';
import 'package:harry_potter/data/preferences.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key, this.showAppBar = true, this.onTap});

  final bool showAppBar;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    var l = AppLocalizations.of(context)!;
    return Consumer<Preferences>(builder: (context, preferences, child) {
      return Consumer<HogwartsData>(
        builder: (context, hogwartsData, child) {
          return Scaffold(
            appBar: (showAppBar)
                ? AppBar(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/hp_icon.png'),
                    ),
                    title: Text(l.hogwarts),
                    actions: [
                      Switch(
                        value: preferences.showSubtitles,
                        onChanged: (value) {
                          preferences.setShowSubtitles(value);
                        },
                      ),
                    ],
                  )
                : null,
            body: ListView(children: [
              for (var character in hogwartsData.characters)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: ListTile(
                    title: Text(character.name),
                    subtitle: preferences.showSubtitles
                        ? Text(l.reviews(character.totalReviews))
                        : null,
                    leading: Hero(
                      tag: character.name,
                      child: Image.asset(character.asset),
                    ),
                    trailing: Icon(character.favorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onTap: onTap == null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetail(
                                  characterId: character.id,
                                ),
                              ),
                            );
                          }
                        : () {
                            onTap!.call(character.id);
                          },
                  ),
                ),
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2030),
                onDateChanged: (date) {},
              )
            ]),
          );
        },
      );
    });
  }
}
