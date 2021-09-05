//@dart=2.9
import 'package:bestasfinal2/screens_bloc/screen_bloc.dart';
import 'package:bestasfinal2/widgets/floor_widget.dart';
import 'package:bestasfinal2/widgets/home_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WinnerScreen extends StatefulWidget {
  String player1Stones;
  String player2Stones;
  int slam;
  String floor;

  WinnerScreen({this.player1Stones, this.player2Stones, this.slam, this.floor});

  @override
  _WinnerScreenState createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    var routerProvider = BlocProvider.of<ScreenBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundWidget(),
            Column(
              children: [
                homeButtonAndLoopButton(routerProvider),
                winner_and_loser_stone(
                    borderColor: Colors.green,
                    winnerName: "Kazanan Oyuncu",
                    winnerStone: widget.player1Stones),
                slam(),
                winner_and_loser_stone(
                  winnerStone: widget.player2Stones,
                  winnerName: "Kaybeden Oyuncu",
                  borderColor: Colors.red,
                ),
                SizedBox(
                  height: 45,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container slam() {
    return Container(
      child: Text(
        "Fark: ${widget.slam}",
        style: TextStyle(
          wordSpacing: -7,
          fontFamily: "Playbill",
          color: Colors.white,
          fontSize: 45,
        ),
      ),
    );
  }

  Flexible winner_and_loser_stone(
      {String winnerName, String winnerStone, Color borderColor}) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: borderColor),
          color: Colors.blueGrey.withOpacity(.4),
        ),
        margin: EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                margin: EdgeInsets.all(15),
                child: FittedBox(
                  child: Text(
                    winnerName,
                    style: TextStyle(color: Colors.white, fontSize: 450),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.loose,
              child: Container(
                child: Image.asset(winnerStone),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding homeButtonAndLoopButton(ScreenBloc routerProvider) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          homeButtonWidget(),
          GestureDetector(
            onTap: () {
              //hılzı yeni oyun

              routerProvider.add(GamePlayScreenEvent(
                  player1Stone: widget.player1Stones,
                  player2Stone: widget.player2Stones,
                  player1SelectFloor: widget.floor));
            },
            child: Icon(
              Icons.loop,
              color: Colors.white,
              size: 45,
            ),
          )
        ],
      ),
    );
  }
}
