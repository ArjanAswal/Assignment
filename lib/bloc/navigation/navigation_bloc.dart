import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomeState());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is HomeEvent) yield HomeState();
    if (event is FavouriteEvent) yield FavouriteState();
  }
}
