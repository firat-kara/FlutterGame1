import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sound_event.dart';
part 'sound_state.dart';

class SoundBloc extends Bloc<SoundEvent, SoundBoolState> {
  SoundBloc() : super(SoundBoolState());

  @override
  Stream<SoundBoolState> mapEventToState(
    SoundEvent event,
  ) async* {
    if(event is SoundBoolEvent){
      yield SoundBoolState(sound: event.sound);
    }
  }
}
