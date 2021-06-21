import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String url;
  final double aspectRatio;

  const VideoPlayerWidget({Key key, this.url, this.aspectRatio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    return BetterPlayer.network(
      url,
      betterPlayerConfiguration: BetterPlayerConfiguration(
        aspectRatio: aspectRatio,
      ),
    );
  }
}
