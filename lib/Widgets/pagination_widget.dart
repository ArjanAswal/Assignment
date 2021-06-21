import 'package:assignment/Clients/pexels_client.dart';
import 'package:assignment/Widgets/media_item.dart';
import 'package:assignment/bloc/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';

class PaginationWidget extends StatelessWidget {
  final state;
  final mediastate;

  PaginationWidget({Key key, this.state, this.mediastate}) : super(key: key);

  List data = [];

  Future<List> loadData(int index) async {
    data = data + await PexelsClient().loadData(index);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: state is HomeState
          ? PaginationView(
              pageFetch: loadData,
              itemBuilder: (BuildContext context, dynamic data, int index) =>
                  MediaItem(data: data, mediastate: mediastate),
              pullToRefresh: true,
              onEmpty: Container(),
              onError: (error) => Container(
                child: Center(
                  child: Text(error.toString()),
                ),
              ),
            )
          : mediastate.favouriteMedia.length > 0
              ? ListView.builder(
                  itemBuilder: (context, index) => MediaItem(
                      data: mediastate.favouriteMedia[index],
                      mediastate: mediastate),
                  itemCount: mediastate.favouriteMedia.length,
                )
              : Center(child: Text('Empty')),
    );
  }
}
