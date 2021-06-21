part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {
  const NavigationEvent();
}

class HomeEvent extends NavigationEvent {}

class FavouriteEvent extends NavigationEvent {}
