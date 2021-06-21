part of 'media_bloc.dart';

@immutable
abstract class MediaEvent {
  const MediaEvent();
}

class AddFavouriteEvent extends MediaEvent {
  final Map favouriteMedia;
  const AddFavouriteEvent({@required this.favouriteMedia})
      : assert(favouriteMedia != null);
}

class RemoveFavouriteEvent extends MediaEvent {
  final Map favouriteMedia;
  const RemoveFavouriteEvent({@required this.favouriteMedia})
      : assert(favouriteMedia != null);
}
