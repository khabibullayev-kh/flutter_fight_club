import 'package:flutter/material.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';

class SecondaryActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SecondaryActionButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(
                color: FightClubColors.darkGreyText,
                width: 2
            )
        ),
        child: Text(text.toUpperCase(), style: TextStyle(color: FightClubColors.darkGreyText, fontSize: 13, fontWeight: FontWeight.w400),),
      ),
    );
  }
}