import 'package:core/models/team/team.dart';
import 'package:flutter/material.dart';
import 'package:kapira_admin/view/teams/widgets/team_card.dart';

class TeamList extends StatelessWidget {
  final List<Team> leagues;
  const TeamList({super.key, required this.leagues});

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
        return TeamCard(league: leagues[index]);
      },
      itemCount: leagues.length,
    );
  }
}
