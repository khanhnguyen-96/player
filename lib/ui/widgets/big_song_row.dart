import 'package:app/constants/colors.dart';
import 'package:app/models/song.dart';
import 'package:app/ui/widgets/song_thumbnail.dart';
import 'package:flutter/material.dart';

class BigSongRow extends StatelessWidget {
  final Song song;
  final EdgeInsetsGeometry? padding;

  const BigSongRow({Key? key, required this.song, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .subtitle2
        ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.dullWhite);
    final artistStyle = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(color: AppColors.dullWhite);
    final songSummaryStyle =
        Theme.of(context).textTheme.caption?.copyWith(color: AppColors.gray);
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SongThumbnail(
            song: song,
            size: ThumbnailSize.s,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  song.title,
                  style: titleStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  song.artist.name,
                  style: artistStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  //TODO: replace placeholder text
                  "5 song - 20:10 - 12443 plays",
                  style: songSummaryStyle,
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
