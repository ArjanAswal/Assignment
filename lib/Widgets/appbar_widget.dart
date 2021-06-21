import 'package:assignment/bloc/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final NavigationState state;

  const AppBarWidget({Key key, this.state}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        state is HomeState ? 'Trending' : 'Favourites',
        style: GoogleFonts.lato(
            color: Theme.of(context).primaryColor,
            letterSpacing: 1.2,
            fontSize: 30,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
