import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/models/player/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class PlayerList extends StatelessWidget {
  final List<Player> players;

  const PlayerList({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final player = players[index];

        return ListTile(
          dense: true,
          title: Text(player.name),
          leading: CachedNetworkImage(
            imageUrl: player.photo.image,
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundColor: context.kTheme.avatarBackground,
              foregroundImage: imageProvider,
            ),
            placeholder: (context, url) => CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BlurHash(hash: player.photo.hash),
                ),
              ),
            ),
            errorWidget: (context, url, err) => CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BlurHash(hash: player.photo.hash),
                ),
              ),
            ),
          ),
          trailing: Text(player.number.toString()),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
      ),
      itemCount: players.length,
      shrinkWrap: true,
    );
  }
}
