import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../theme/border_radius.dart';
import '../theme/padding.dart';
import '../theme/shadow.dart';
import '../util/page_navigation.dart';
import 'hyperlink.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.videoID});

  final String videoID;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: ThemePadding.px2,
        child: Hyperlink(
            onTap: () => route(context, VideoPlayerYouTube(videoID: videoID)),
            child: Container(
                alignment: Alignment.center,
                width: 300,
                height: 300 / (16 / 9),
                decoration: BoxDecoration(boxShadow: ThemeShadow.primary, borderRadius: ThemeBorderRadius.r4, image: DecorationImage(image: CachedNetworkImageProvider("https://i3.ytimg.com/vi/$videoID/maxresdefault.jpg"), fit: BoxFit.fitWidth)),
                child: SvgPicture.asset("assets/svg/play.svg", width: 64, height: 64))));
  }
}


class VideoPlayerYouTube extends StatefulWidget {
  const VideoPlayerYouTube({super.key, required this.videoID});
  final String videoID;

  @override
  State<VideoPlayerYouTube> createState() => _VideoPlayerYouTubeState();
}

class _VideoPlayerYouTubeState extends State<VideoPlayerYouTube> {
  late final YoutubePlayerController _controller = YoutubePlayerController(initialVideoId: widget.videoID, flags: const YoutubePlayerFlags(autoPlay: true, forceHD: true));
  @override
  Widget build(BuildContext context) => SafeArea(
      child: RotatedBox(quarterTurns: 1,
      child: YoutubePlayerBuilder(player: YoutubePlayer(controller: _controller, showVideoProgressIndicator: true), builder: (context, player) => player))
    );
}
