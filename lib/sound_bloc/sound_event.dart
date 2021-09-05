part of 'sound_bloc.dart';

@immutable
abstract class SoundEvent {}

class SoundBoolEvent extends SoundEvent{
  var sound;
  SoundBoolEvent({this.sound});
}