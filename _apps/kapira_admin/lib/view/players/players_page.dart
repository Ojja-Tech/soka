import 'package:core/models/team/team.dart';
import 'package:flutter/material.dart';

class PlayersPage extends StatelessWidget {
  final Team team;
  const PlayersPage({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(team.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const Text('Players'),
    );
  }
}
