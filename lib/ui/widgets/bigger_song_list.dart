import 'package:app/models/song.dart';
import 'package:app/ui/widgets/big_song_row.dart';
import 'package:app/ui/widgets/song_row.dart';
import 'package:app/ui/widgets/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A bigger and simple song list to display a small amount of song rows.
/// Not meant to be used for a great number for rows, in such a case
/// use SliverList or something similar instead.
class BiggerSongList extends StatelessWidget {
  final Iterable<Song>? songs;
  final Iterable<Widget>? children;
  final String? headingText;
  final bool bordered;
  final void Function()? onHeaderTap;

  const BiggerSongList({
    Key? key,
    this.songs,
    this.children,
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
        if (songs != null)
          ...songs!
              .map((song) => BigSongRow(song: song))
              .toList(growable: false),
        if (children != null) ...children!,
      ],
    );
  }
}
