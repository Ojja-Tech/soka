import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/models/team/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class TeamCard extends StatelessWidget {
  final Team team;
  final VoidCallback? onTap;
  const TeamCard({super.key, required this.team, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(context.width),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.kTheme.cardColor,
            ),
            padding: const EdgeInsets.all(10),
            child: CachedNetworkImage(
              imageUrl: team.logo.image,
              placeholder: (context, url) => ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BlurHash(hash: team.logo.hash),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          team.name,
          maxLines: 1,
          overflow: TextOverflow.clip,
        )
      ],
    );
  }
}
