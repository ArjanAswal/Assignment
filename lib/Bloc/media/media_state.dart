part of 'media_bloc.dart';

@immutable
abstract class MediaState {
  final List<Map> favouriteMedia;
  const MediaState({@required this.favouriteMedia});
}

class InitialMediaState extends MediaState {
  final List<Map<dynamic, dynamic>> favouriteMedia;
  const InitialMediaState({@required this.favouriteMedia})
      : assert(favouriteMedia != null);
}
