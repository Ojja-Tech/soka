import 'package:core/core.dart';
import 'package:core/models/team/team.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final Team league;
  const TeamCard({super.key, required this.league});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(context.width),
          child: Container(
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
