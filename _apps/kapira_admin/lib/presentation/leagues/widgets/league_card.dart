import 'package:core/core.dart';
import 'package:core/models/league/league.dart';
import 'package:flutter/material.dart';

class LeagueCard extends StatelessWidget {
  final League league;
  const LeagueCard({super.key, required this.league});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.kTheme.cardColor,
          ),
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            league.logo,
            package: 'assets',
          ),
        ),
        const SizedBox(height: 10),
        Text(
          league.name,
          maxLines: 1,
          overflow: TextOverflow.clip,
        )
      ],
    );
  }
}
