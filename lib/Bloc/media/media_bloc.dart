import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'media_event.dart';

part 'media_state.dart';

class MediaBloc extends HydratedBloc<MediaEvent, MediaState> {
  MediaBloc() : super(InitialMediaState(favouriteMedia: []));

  @override
  Stream<MediaState> mapEventToState(MediaEvent event) async* {
    List<Map<dynamic, dynamic>> temp = state.favouriteMedia;

    if (event is AddFavouriteEvent) {
      temp.add(event.favouriteMedia);
    } else if (event is RemoveFavouriteEvent) {
      temp.remove(event.favouriteMedia);
    }

    InitialMediaState(favouriteMedia: temp);
  }

  @override
  MediaState fromJson(Map<String, dynamic> json) =>
      InitialMediaState(favouriteMedia: [...json['favouriteMedia']]);

  @override
  Map<String, dynamic> toJson(MediaState state) =>
      {'favouriteMedia': state.favouriteMedia};
}
