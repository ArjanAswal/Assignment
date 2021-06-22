import 'package:assignment/bloc/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class BottomBarWidget extends StatefulWidget {
  final NavigationState state;

  const BottomBarWidget({Key key, this.state}) : super(key: key);
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _selectedItemPosition = 0;
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return Container(
          height: connected ? 100 : 150,
          child: Column(
            children: [
              SnakeNavigationBar.color(
                behaviour: SnakeBarBehaviour.floating,
                snakeShape: SnakeShape.circle,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                backgroundColor: Theme.of(context).backgroundColor,
                snakeViewColor: Theme.of(context).accentColor,
                selectedItemColor: Theme.of(context).backgroundColor,
                unselectedItemColor: Theme.of(context).primaryColor,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                currentIndex: _selectedItemPosition,
                onTap: (index) => setState(() {
                  if (_selectedItemPosition != index) {
                    _selectedItemPosition = index;

                    BlocProvider.of<NavigationBloc>(context).add(
                        widget.state is HomeState
                            ? FavouriteEvent()
                            : HomeEvent());
                  }
                }),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'tickets'),
                ],
              ),
              if (!connected)
                Container(
                  height: 50,
                  color: Colors.redAccent,
                  child: Center(child: Text('No Internet')),
                ),
            ],
          ),
        );
      },
      child: Container(),
    );
  }
}
