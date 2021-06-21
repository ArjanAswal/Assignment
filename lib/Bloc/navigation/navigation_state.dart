part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {
  const NavigationState();
}

class HomeState extends NavigationState {}

class FavouriteState extends NavigationState {}
