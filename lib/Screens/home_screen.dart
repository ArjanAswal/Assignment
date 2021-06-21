import 'package:assignment/Widgets/appbar_widget.dart';
import 'package:assignment/Widgets/bottombar_widget.dart';
import 'package:assignment/Widgets/pagination_widget.dart';
import 'package:assignment/bloc/media/media_bloc.dart';
import 'package:assignment/bloc/navigation/navigation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(builder: (_, state) {
      return Scaffold(
        appBar: AppBarWidget(state: state),
        body: BlocBuilder<MediaBloc, MediaState>(
          builder: (_, mediastate) {
            return PaginationWidget(state: state, mediastate: mediastate);
          },
        ),
        bottomNavigationBar: BottomBarWidget(state: state),
      );
    });
  }
}
