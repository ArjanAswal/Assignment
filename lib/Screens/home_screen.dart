import 'package:assignment/Clients/pexels_client.dart';
import 'package:assignment/Widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool hasLoaded = false;
  List data;
  Future loadData() async {
    data = data + await PexelsClient().loadData(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.done || hasLoaded
                ? Container()
                : Center(child: LoadingIndicator()),
      ),
    );
  }
}
