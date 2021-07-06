import 'package:app/models/song.dart';
import 'package:app/providers/song_provider.dart';
import 'package:app/ui/widgets/bottom_space.dart';
import 'package:app/ui/widgets/song_list.dart';
import 'package:app/ui/widgets/song_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SongsScreen extends StatefulWidget {
  final String? previousPageTitle;

  const SongsScreen({Key? key, this.previousPageTitle}) : super(key: key);

  @override
  _SongsScreenState createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  late SongProvider songProvider;
  late List<Song> _songs = [];

  @override
  void initState() {
    super.initState();
    songProvider = context.read();
    setState(() => _songs = songProvider.songs);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.black,
            previousPageTitle: widget.previousPageTitle,
            largeTitle: const Text(
              'Songs',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          SliverToBoxAdapter(child: songListButtons(context, songs: _songs)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) => SongRow(song: _songs[index]),
              childCount: _songs.length,
            ),
          ),
          SliverToBoxAdapter(child: bottomSpace()),
        ],
      ),
    );
  }
}