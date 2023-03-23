import 'package:flutter/material.dart';
import 'package:kapira_admin/presentation/leagues/widgets/league_card.dart';

class LeagueList extends StatelessWidget {
  const LeagueList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: .77,
      ),
      children: const [LeagueCard()],
    );
  }
}
