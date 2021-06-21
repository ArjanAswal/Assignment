import 'package:assignment/Functions/get_title.dart';
import 'package:assignment/Widgets/image_widget.dart';
import 'package:assignment/Widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MediaItem extends StatelessWidget {
  final Map data;

  const MediaItem({Key key, this.data}) : super(key: key);

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
          SizedBox(height: 20),
          LikeButton(
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          SizedBox(height: 10),
          Text(getTitle(data['url'])),
          SizedBox(height: 5),
          Text(
            isVideo ? data['user']['name'] : data['photographer'],
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ],
      ),
    );
  }
}
