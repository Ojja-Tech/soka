import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/models/league/league.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class LeagueCard extends StatelessWidget {
  final League league;
  final VoidCallback? onTap;
  const LeagueCard({
    super.key,
    required this.league,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.kTheme.cardColor,
            ),
            padding: const EdgeInsets.all(10),
            child: CachedNetworkImage(
              imageUrl: league.logo.image,
              placeholder: (context, url) => ClipRRect(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: BlurHash(hash: league.logo.hash),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          league.name,
          maxLines: 1,
          overflow: TextOverflow.clip,
        )
      ],
    );
  }
}
