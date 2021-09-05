//@dart=2.9

import 'package:bestasfinal2/screens_bloc/screen_bloc.dart';
import 'package:bestasfinal2/sound_bloc/sound_bloc.dart';
import 'package:bestasfinal2/widgets/floor_widget.dart';
import 'package:bestasfinal2/widgets/home_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../game_controller.dart';
import '../sound_controller.dart';

class GamePlayeScreen extends StatefulWidget {
  String player1Stones;
  String player2Stones;
  String player1SelectFloor;

  GamePlayeScreen(
      {this.player1Stones, this.player2Stones, this.player1SelectFloor});

  @override
  _GamePlayeScreenState createState() => _GamePlayeScreenState();
}

class _GamePlayeScreenState extends State<GamePlayeScreen> {
  List<String> image = List.filled(64, "lib/assets/images/click2.png");
  bool player1 = true;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var routerProvider = BlocProvider.of<ScreenBloc>(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          Column(
            children: [
              homeButtonAndText(routerProvider),
              /* currentMove(),*/
              floor(width, image),
              SizedBox(
                height: 100,
              )
            ],
          )
        ],
      ),
    ));
  }

  Container floor(double width, List<String> image) {
    return Container(
      alignment: Alignment.center,
      height: width,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(widget.player1SelectFloor),
        ),
      ),
      child: GridView.builder(
        itemCount: image.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (context, index) {
          var soundBloc = BlocProvider.of<SoundBloc>(context);
          return BlocBuilder<SoundBloc, SoundBoolState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  if (image[index] != widget.player1Stones &&
                      image[index] != widget.player2Stones) {
                    if (player1 == true) {
                      image[index] = widget.player1Stones;
                    } else {
                      image[index] = widget.player2Stones;
                    }
                    GameControl(
                      floor: widget.player1SelectFloor,
                      context: context,
                      slam: (image.length - counter),
                      floorList: image,
                      playerString: player1 == true
                          ? widget.player1Stones
                          : widget.player2Stones,
                      oldPlayerString: player1 == false
                          ? widget.player1Stones
                          : widget.player2Stones,
                    );
                    player1 = !player1;
                    counter++;
                    if(state.sound==true){
                      SoundController();
                    }
                    setState(() {});
                  }


                },
                child: Container(
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border.all(width: .5, color: Colors.black),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(image[index]),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Padding homeButtonAndText(ScreenBloc routerProvider) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          homeButtonWidget(),
          Container(
            width: 45,
            height: 45,
            child: Image.asset(
                player1 == true ? widget.player1Stones : widget.player2Stones),
          ),
         image.length>1? Text(
            (image.length - counter).toString(),
            style: TextStyle(
              wordSpacing: -7,
              fontFamily: "Playbill",
              color: Colors.white,
              fontSize: 45,
            ),
          ):      GestureDetector(
           onTap: () {
             //hılzı yeni oyun
             routerProvider.add(GamePlayScreenEvent(
                 player1Stone: widget.player1Stones,
                 player2Stone: widget.player2Stones,
                 player1SelectFloor: widget.player1SelectFloor));
           },
           child: Icon(
             Icons.loop,
             color: Colors.white,
             size: 45,
           ),
         ),
        ],
      ),
    );
  }
}
