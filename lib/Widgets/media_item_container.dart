import 'package:assignment/Functions/get_title.dart';
import 'package:assignment/bloc/media/media_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

class MediaItemContainer extends StatelessWidget {
  const MediaItemContainer({
    Key key,
    @required this.mediastate,
    @required this.data,
    @required this.isVideo,
  }) : super(key: key);

  final MediaState mediastate;
  final Map data;
  final bool isVideo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          LikeButton(
            mainAxisAlignment: MainAxisAlignment.start,
            isLiked: mediastate.favouriteMedia.contains(data),
            onTap: (isFavourite) async {
              BlocProvider.of<MediaBloc>(context).add(
                  mediastate.favouriteMedia.contains(data)
                      ? RemoveFavouriteEvent(favouriteMedia: data)
                      : AddFavouriteEvent(favouriteMedia: data));
              return !isFavourite;
            },
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
