import 'package:assets/assets.dart';
import 'package:core/core.dart';
import 'package:core/models/app_image.dart';
import 'package:core/models/league/league.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router/router.dart';

import 'widgets/add_league.dart';
import 'widgets/league_list.dart';

class LeaguesPage extends StatelessWidget {
  const LeaguesPage({super.key});

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
              'Available Leagues',
              style: context.headlineMedium,
            ),
            const SizedBox(height: 15),
            Text(
              'Select a league to view the clubs',
              style: context.labelLarge?.copyWith(
                color: context.kTheme.secondary1,
              ),
            )
          ],
        ),
        toolbarHeight: 80,
      ),
      body: LeagueList(
        leagues: const [
          League(
            id: '0',
            name: 'Butiki League',
            logo: AppImage(
                image:
                    'https://cdn.pixabay.com/photo/2017/02/05/14/59/logo-2040327_1280.png',
                hash: 'L5H2EC=PM+yV0g-mq.wG9c010J}I'),
            seasons: [],
          )
        ],
        onLeagueSelect: (league) {
          context.push(AppRoute.TEAMS.path, extra: league);
        },
      ),
      floatingActionButton: ElevatedButton.icon(
        label: const Text('Add League'),
        icon: const Icon(KapiraIcon.trophy),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddLeague();
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
