import 'package:assignment/Clients/pexels_client.dart';
import 'package:assignment/Widgets/appbar_widget.dart';
import 'package:assignment/Widgets/loading_indicator.dart';
import 'package:assignment/Widgets/media_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: PaginationView(
          pageFetch: loadData,
          itemBuilder: (BuildContext context, dynamic data, int index) =>
              MediaItem(data: data),
          onEmpty: Container(),
          onError: (error) => Container(
            child: Center(
              child: Text(error.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
