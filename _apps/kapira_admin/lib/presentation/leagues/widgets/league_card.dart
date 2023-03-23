import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LeagueCard extends StatelessWidget {
  const LeagueCard({super.key});

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
            'lib/images/butiki-league.png',
            package: 'assets',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Butiki League',
          maxLines: 1,
          overflow: TextOverflow.clip,
        )
      ],
    );
  }
}
