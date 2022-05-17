import 'package:app/constants/colors.dart';
import 'package:app/constants/images.dart';
import 'package:app/models/artist.dart';
import 'package:app/utils/preferences.dart' as preferences;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArtistRow extends StatelessWidget {
  final Artist artist;
  final EdgeInsetsGeometry? padding;

  const ArtistRow({Key? key, required this.artist, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final artistStyle = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(fontWeight: FontWeight.w500, color: AppColors.dullWhite);
    final artistSummaryStyle =
        Theme.of(context).textTheme.caption?.copyWith(color: AppColors.gray);
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(56),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: 56,
              height: 56,
              placeholder: (_, __) => defaultImage,
              errorWidget: (_, __, ___) => defaultImage,
              imageUrl: artist.imageUrl ?? preferences.defaultImageUrl,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  artist.name,
                  style: artistStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  //TODO: replace placeholder text
                  "5 song - 2 albums - 12443 plays",
                  style: artistSummaryStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
