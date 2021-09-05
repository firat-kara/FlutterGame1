//@dart=2.9
part of 'screen_bloc.dart';

@immutable
abstract class ScreenState {}

class StartScreenState extends ScreenState {}

class HowToPlayScreenState  extends ScreenState {}

class Player1ScreenState extends ScreenState {}

class Player2ScreenState  extends ScreenState {
  String player1Stone;
  String player1SelectFloor;

  Player2ScreenState ({this.player1Stone, this.player1SelectFloor});
}

class GamePlayScreenState  extends ScreenState {
  String player1Stone;
  String player2Stone;
  String player1SelectFloor;

  GamePlayScreenState (
      {this.player1Stone, this.player2Stone, this.player1SelectFloor});
}

class WinnerScreenState  extends ScreenState{
  String player1Stone;
  String player2Stone;
  String floor;
  int slam;
  WinnerScreenState ({this.player1Stone,this.player2Stone,this.slam,this.floor});
}