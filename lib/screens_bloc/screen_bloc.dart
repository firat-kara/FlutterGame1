//@dart=2.9

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screen_event.dart';
part 'screen_state.dart';


class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc() : super(StartScreenState());

  @override
  Stream<ScreenState> mapEventToState(
    ScreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is StartScreenEvent) {
      yield StartScreenState();
    }
    if (event is HowToPlayScreenEvent) {
      yield HowToPlayScreenState();
    }
    if (event is Player1ScreenEvent) {
      yield Player1ScreenState();
    }
    if (event is Player2ScreenEvent) {
      yield Player2ScreenState(
          player1SelectFloor: event.player1SelectFloor,
          player1Stone: event.player1Stone);
    }
    if (event is GamePlayScreenEvent) {
      yield GamePlayScreenState(
          player1Stone: event.player1Stone,
          player2Stone: event.player2Stone,
          player1SelectFloor: event.player1SelectFloor);
    }
    if (event is WinnerScreenEvent) {
      yield WinnerScreenState(
          player1Stone: event.player1Stone,
          player2Stone: event.player2Stone,
          slam: event.slam,floor: event.floor);
    }
  }
}
