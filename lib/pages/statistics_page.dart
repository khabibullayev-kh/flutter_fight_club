import 'package:flutter/material.dart';
import 'package:flutter_fight_club/fight_result.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FightClubColors.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 24),
                child: Text('Statistics',
                    style: TextStyle(
                        color: FightClubColors.darkGreyText, fontSize: 24, fontWeight: FontWeight.w400))),
            Expanded(child: SizedBox()),
            FutureBuilder<SharedPreferences>(
                future: SharedPreferences.getInstance(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const SizedBox();
                  }
                  final SharedPreferences sp = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Won: ${sp.getInt('stats_won') ?? 0}", style: TextStyle(fontSize: 16, color: FightClubColors.darkGreyText)),
                      const SizedBox(height: 6),
                      Text("Lost: ${sp.getInt('stats_lost') ?? 0}", style: TextStyle(fontSize: 16, color: FightClubColors.darkGreyText)),
                      const SizedBox(height: 6),
                      Text("Draw: ${sp.getInt('stats_draw') ?? 0}", style: TextStyle(fontSize: 16, color: FightClubColors.darkGreyText)),
                      const SizedBox(height: 6),
                    ]
                  );
                }),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SecondaryActionButton(
                  text: 'Back',
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
