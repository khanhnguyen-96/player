import 'package:app/constants/colors.dart';
import 'package:app/constants/images.dart' as images;
import 'package:app/constants/dimensions.dart';
import 'package:app/models/song.dart';
import 'package:app/providers/album_provider.dart';
import 'package:app/providers/artist_provider.dart';
import 'package:app/providers/interaction_provider.dart';
import 'package:app/providers/song_provider.dart';
import 'package:app/ui/screens/albums.dart';
import 'package:app/ui/screens/artists.dart';
import 'package:app/ui/screens/favorites.dart';
import 'package:app/ui/screens/profile.dart';
import 'package:app/ui/screens/root.dart';
import 'package:app/ui/screens/songs.dart';
import 'package:app/ui/widgets/album_card.dart';
import 'package:app/ui/widgets/artist_card.dart';
import 'package:app/ui/widgets/bigger_3_row_item.dart';
import 'package:app/ui/widgets/bigger_song_list.dart';
import 'package:app/ui/widgets/bottom_space.dart';
import 'package:app/ui/widgets/horizontal_card_scroller.dart';
import 'package:app/ui/widgets/rounded_tab_bar_decoration.dart';
import 'package:app/ui/widgets/simple_artist_list.dart';
import 'package:app/ui/widgets/simple_song_list.dart';
import 'package:app/ui/widgets/song_card.dart';
import 'package:app/ui/widgets/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = const <Tab>[
    Tab(text: "Home"),
    Tab(text: "Songs"),
    Tab(text: "Albums"),
    Tab(text: "Artists"),
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    late SongProvider songProvider = context.watch();
    late ArtistProvider artistProvider = context.watch();
    late AlbumProvider albumProvider = context.watch();
    late InteractionProvider interactionProvider = context.watch();

    late List<Widget> homeBlocks;

    if (songProvider.songs.isEmpty) {
      homeBlocks = <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Looks like your library is empty. '
                    'You can add songs using the web interface or via the '
                    'command line.',
                style: TextStyle(color: Colors.white54),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const RootScreen(),
                          ),
                        );
                      },
                      child: const Text('Refresh'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ];
    } else {
      homeBlocks = <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: AppDimensions.horizontalPadding,
              right: AppDimensions.horizontalPadding,
              bottom: 12,
              top: 19),
          child: SimpleSongList(
            headingText: "Most played",
            songs: songProvider.mostPlayed().take(3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.horizontalPadding,
            vertical: 12,
          ),
          child: SimpleSongList(
            headingText: "Recently played",
            songs: songProvider.recentlyAdded().take(3),
          ),
        ),
        //TODO placeholder only
        Padding(
          padding: const EdgeInsets.only(
            left: AppDimensions.horizontalPadding,
            right: AppDimensions.horizontalPadding,
            top: 12,
            bottom: 8,
          ),
          child: BiggerSongList(
            headingText: "Recently added",
            songs: songProvider.recentlyAdded().take(4),
          ),
        ),
        //TODO placeholder only
        Padding(
          padding: const EdgeInsets.only(
            left: AppDimensions.horizontalPadding,
            right: AppDimensions.horizontalPadding,
            top: 0,
            bottom: 12,
          ),
          child: SimpleSongList(
            songs: songProvider.recentlyAdded().take(3),
          ),
        ),
        /*Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.horizontalPadding,
            vertical: 12,
          ),
          child: SimpleSongList(
            songs: interactionProvider.getRandomFavorites(limit: 5),
            headingText: 'From your favorites',
            onHeaderTap: () => Navigator.of(context)
                .push(CupertinoPageRoute(builder: (_) => FavoritesScreen())),
          ),
        ),*/
        /*HorizontalCardScroller(
          headingText: 'Top albums',
          cards: <Widget>[
            ...albumProvider
                .mostPlayed()
                .map((album) => AlbumCard(album: album)),
            PlaceholderCard(
              icon: CupertinoIcons.music_albums,
              onPressed: () => Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (_) => AlbumsScreen())),
            ),
          ],
        ),*/
        Padding(
          padding: const EdgeInsets.only(
            left: AppDimensions.horizontalPadding,
            right: AppDimensions.horizontalPadding,
            top: 0,
            bottom: 12,
          ),
          child: SimpleArtistList(
            headingText: 'Top artists',
            artists: artistProvider.mostPlayed().take(3),
          ),
        ),
        /*HorizontalCardScroller(
          headingText: 'Top artists',
          cards: <Widget>[
            ...artistProvider
                .mostPlayed()
                .map((artist) => ArtistCard(artist: artist)),
            PlaceholderCard(
              icon: CupertinoIcons.music_mic,
              onPressed: () => Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (_) => ArtistsScreen())),
            ),
          ],
        ),*/
        /*Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.horizontalPadding,
            vertical: 12,
          ),
          child: SimpleSongList(
            songs: songProvider.leastPlayed(limit: 5),
            headingText: 'Hidden gems',
          ),
        ),*/
        Padding(
          padding: const EdgeInsets.only(
            left: AppDimensions.horizontalPadding,
            right: AppDimensions.horizontalPadding,
            top: 12,
            bottom: 8,
          ),
          child: BiggerSongList(
            headingText: "Top albums",
            children: albumProvider
                .mostPlayed()
                .take(4)
                .map((e) => Bigger3RowDetailItem(
              title: e.name,
              subtitle: e.artist.name,
              //TODO placeholder only
              caption: "5 song - 20:10 - 12443 plays",
            ))
                .toList(growable: false),
          ),
        ),
      ];
    }

    return Scaffold(
      body: CupertinoTheme(
        data: CupertinoThemeData(
          primaryColor: Colors.white,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              leading: const Icon(
                Icons.menu,
                color: AppColors.dullWhite,
              ),
              actions: [
                images.iconSearch,
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                    CupertinoPageRoute(builder: (_) => const ProfileScreen()),
                  ),
                  icon: images.iconProfile,
                ),
              ],
              title: _buildTitle(),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.white,
                      labelPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 16),
                      labelColor: AppColors.black2,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: RoundedTabBarIndicator(
                        indicatorHeight: 32,
                        indicatorColor: AppColors.brightYellow,
                        tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      ),
                      tabs: tabs,
                      controller: _tabController,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(delegate: SliverChildListDelegate.fixed(homeBlocks)),
            const BottomSpace(height: 128),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "MUSIC",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.yellow,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class MostPlayedSongs extends StatelessWidget {
  final List<Song> songs;
  final BuildContext context;

  const MostPlayedSongs({
    Key? key,
    required this.songs,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: AppDimensions.horizontalPadding),
          child: const Heading5(text: 'Most played'),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...songs.expand(
                    (song) => [
                  const SizedBox(width: AppDimensions.horizontalPadding),
                  SongCard(song: song),
                ],
              ),
              const SizedBox(width: AppDimensions.horizontalPadding),
              PlaceholderCard(
                icon: CupertinoIcons.music_note,
                onPressed: () => Navigator.of(context, rootNavigator: true)
                    .pushNamed(SongsScreen.routeName),
              ),
              const SizedBox(width: AppDimensions.horizontalPadding),
            ],
          ),
        ),
      ],
    );
  }
}
