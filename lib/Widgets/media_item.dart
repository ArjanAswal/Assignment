import 'package:assignment/Widgets/image_widget.dart';
import 'package:assignment/Widgets/media_item_container.dart';
import 'package:assignment/Widgets/video_player_widget.dart';
import 'package:assignment/bloc/media/media_bloc.dart';
import 'package:flutter/material.dart';

class MediaItem extends StatelessWidget {
  final Map data;
  final MediaState mediastate;

  const MediaItem({Key key, this.data, this.mediastate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isVideo = data.containsKey('duration');

    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isVideo
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: VideoPlayerWidget(
                    url: data['video_files'][2]['link'],
                    aspectRatio: data['width'] / data['height'],
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ImageWidget(data: data)),
          MediaItemContainer(
              mediastate: mediastate, data: data, isVideo: isVideo),
        ],
      ),
    );
  }
}
