import 'package:app/models/artist.dart';
import 'package:app/ui/widgets/artist_row.dart';
import 'package:app/ui/widgets/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A simple artist list to display a small amount of artist rows.
/// Not meant to be used for a great number for rows, in such a case
/// use SliverList or something similar instead.
class SimpleArtistList extends StatelessWidget {
  final Iterable<Artist> artists;
  final String? headingText;
  final bool bordered;
  final void Function()? onHeaderTap;

  const SimpleArtistList({
    Key? key,
    required this.artists,
    this.headingText,
    this.bordered = false,
    this.onHeaderTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (headingText != null)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onHeaderTap,
            child: CustomHeading5(
              text: headingText!,
              style: const TextStyle(fontSize: 16),
              padding: const EdgeInsets.only(bottom: 16),
            ),
          ),
        ...artists.map(
          (artist) => ArtistRow(
            artist: artist,
            padding: const EdgeInsets.symmetric(horizontal: 0),
          ),
        )
      ],
    );
  }
}
