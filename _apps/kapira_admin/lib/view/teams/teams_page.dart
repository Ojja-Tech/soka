import 'package:assets/assets.dart';
import 'package:core/core.dart';
import 'package:core/models/league/league.dart';
import 'package:core/models/team/team.dart';
import 'package:flutter/material.dart';
import 'package:kapira_admin/view/teams/widgets/team_list.dart';

import 'widgets/add_team.dart';

class TeamsPage extends StatelessWidget {
  final League league;
  const TeamsPage({super.key, required this.league});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${league.name} Teams',
              style: context.headlineMedium,
            ),
            const SizedBox(height: 15),
            Text(
              'Select a team to manage it',
              style: context.labelLarge?.copyWith(
                color: context.kTheme.secondary1,
              ),
            )
          ],
        ),
        toolbarHeight: 80,
      ),
      body: const TeamList(
        leagues: [
          Team(
              id: "0-five",
              name: 'O-FIVE FC',
              logo: 'lib/images/butiki-league.png',
              code: 'O-FIVE')
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        label: const Text('Add Team'),
        icon: const Icon(KapiraIcon.users),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: context.kTheme.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              builder: (context) {
                return const AddTeam();
              });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: context.kTheme.primary3,
          foregroundColor: context.kTheme.secondary0,
        ),
      ),
    );
  }
}
