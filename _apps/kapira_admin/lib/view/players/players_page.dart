import 'package:core/core.dart';
import 'package:core/models/app_image.dart';
import 'package:core/models/player/birth.dart';
import 'package:core/models/player/player.dart';
import 'package:core/models/team/team.dart';
import 'package:flutter/material.dart';
import 'package:kapira_admin/view/players/widgets/player_list.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.kTheme.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      Text('Players'),
                      Spacer(),
                      Text('See All'),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      Text('Player Name'),
                      Spacer(),
                      Text('Number'),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const PlayerList(players: [
                    Player(
                      id: 'id',
                      name: 'J. Doe',
                      firstname: 'John',
                      lastname: 'Doe',
                      age: 24,
                      birth: Birth(date: '29-04-1993', country: 'Uganda'),
                      nationality: 'Ugandan',
                      height: '134 cm',
                      weight: '55 kg',
                      injured: false,
                      photo: AppImage(
                        image:
                            'https://source.unsplash.com/mEZ3PoFGs_k/100x125',
                        hash: 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
                      ),
                      number: 144,
                      position: 'Midfield',
                    ),
                    Player(
                      id: 'id',
                      name: 'J. Doe',
                      firstname: 'John',
                      lastname: 'Doe',
                      age: 24,
                      birth: Birth(date: '29-04-1993', country: 'Uganda'),
                      nationality: 'Ugandan',
                      height: '134 cm',
                      weight: '55 kg',
                      injured: false,
                      photo: AppImage(
                        image:
                            'https://source.unsplash.com/iFgRcqHznqg/100x125',
                        hash: 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
                      ),
                      number: 144,
                      position: 'Midfield',
                    ),
                    Player(
                      id: 'id',
                      name: 'J. Doe',
                      firstname: 'John',
                      lastname: 'Doe',
                      age: 24,
                      birth: Birth(date: '29-04-1993', country: 'Uganda'),
                      nationality: 'Ugandan',
                      height: '134 cm',
                      weight: '55 kg',
                      injured: false,
                      photo: AppImage(
                        image:
                            'https://source.unsplash.com/-Tc8w2Kvsf8/100x125',
                        hash: 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
                      ),
                      number: 144,
                      position: 'Midfield',
                    ),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
