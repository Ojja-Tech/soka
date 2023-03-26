import 'package:core/models/team/team.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kapira_admin/view/teams/widgets/team_card.dart';
import 'package:router/router.dart';

class TeamList extends StatelessWidget {
  final List<Team> teams;
  const TeamList({super.key, required this.teams});

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
        return TeamCard(
          team: teams[index],
          onTap: () {
            context.push(AppRoute.PLAYERS.path, extra: teams[index]);
          },
        );
      },
      itemCount: teams.length,
    );
  }
}
