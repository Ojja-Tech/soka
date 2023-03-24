import 'package:core/models/league/league.dart';
import 'package:flutter/material.dart';
import 'package:kapira_admin/view/leagues/widgets/league_card.dart';

class LeagueList extends StatelessWidget {
  final List<League> leagues;
  final Function(League)? onLeagueSelect;
  const LeagueList({
    super.key,
    required this.leagues,
    this.onLeagueSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: .77,
      ),
      itemBuilder: (context, index) {
        return LeagueCard(
          league: leagues[index],
          onTap: () {
            onLeagueSelect?.call(leagues[index]);
          },
        );
      },
      itemCount: leagues.length,
    );
  }
}
