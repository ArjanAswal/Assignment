import 'package:assignment/Clients/pexels_client.dart';
import 'package:assignment/Widgets/appbar_widget.dart';
import 'package:assignment/Widgets/bottombar_widget.dart';
import 'package:assignment/Widgets/media_item.dart';
import 'package:assignment/bloc/navigation/navigation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_view/pagination_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];

  Future<List> loadData(int index) async {
    data = data + await PexelsClient().loadData(index);
    return data;
  }

  Future<List> loadFavourites(int index) async {
    data = [];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(builder: (_, state) {
      return Scaffold(
        appBar: AppBarWidget(state: state),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: PaginationView(
            key: UniqueKey(),
            pageFetch: state is HomeState ? loadData : loadFavourites,
            itemBuilder: (BuildContext context, dynamic data, int index) =>
                MediaItem(data: data),
            pullToRefresh: true,
            onEmpty: Container(),
            onError: (error) => Container(
              child: Center(
                child: Text(error.toString()),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomBarWidget(state: state),
      );
    });
  }
}
