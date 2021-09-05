//@dart=2.9
part of 'screen_bloc.dart';

@immutable
abstract class ScreenEvent {}

class StartScreenEvent extends ScreenEvent {}

class HowToPlayScreenEvent extends ScreenEvent {}

class Player1ScreenEvent extends ScreenEvent {}

class Player2ScreenEvent extends ScreenEvent {
  String player1Stone;
  String player1SelectFloor;

  Player2ScreenEvent({this.player1Stone, this.player1SelectFloor});
}

class GamePlayScreenEvent extends ScreenEvent {
  String player1Stone;
  String player2Stone;
  String player1SelectFloor;

  GamePlayScreenEvent(
      {this.player1Stone, this.player2Stone, this.player1SelectFloor});
}

class WinnerScreenEvent extends ScreenEvent{
  String player1Stone;
  String player2Stone;
  String floor;
  int slam;
  WinnerScreenEvent({this.player1Stone,this.player2Stone,this.slam,this.floor});
}