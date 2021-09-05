//@dart=2.9
import 'package:bestasfinal2/screens_bloc/screen_bloc.dart';
import 'package:bestasfinal2/widgets/floor_widget.dart';
import 'package:bestasfinal2/widgets/home_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Player2Screen extends StatefulWidget {
  String player1Stones;
  String player1SelectFloor;

  Player2Screen({this.player1Stones, this.player1SelectFloor});

  @override
  _Player2ScreenState createState() => _Player2ScreenState();
}

class _Player2ScreenState extends State<Player2Screen> {
  String selectStone;

  List<bool> selectStoneNumber = List.filled(23, false);

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
              homeButtonAndText(routerProvider),
              stoneSelect(),
              controlBoard(widget.player1SelectFloor),
              goToPlayScreen(routerProvider)
            ],
          )
        ],
      ),
    ));
  }

  Container goToPlayScreen(ScreenBloc routerProvider) {
    return Container(
      margin: EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          if (widget.player1SelectFloor != null &&
              widget.player1Stones != null &&
              selectStone != null) {
            routerProvider.add(GamePlayScreenEvent(
              player1SelectFloor: widget.player1SelectFloor,
              player1Stone: widget.player1Stones,
              player2Stone: selectStone,
            ));
          }
          //oyunu başlat
        },
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }

  Flexible controlBoard(String floor) {
    return Flexible(
      flex: 5,
      fit: FlexFit.loose,
      child: Container(
        height: 200,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: Colors.teal,
          image: DecorationImage(
            image: AssetImage(floor),
          ),
        ),
        child: GridView.builder(
          itemCount: 36,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
          itemBuilder: (context, index) {
            return RotatedBox(
              quarterTurns: index,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: selectStone != null
                        ? AssetImage(selectStone)
                        : AssetImage(widget.player1Stones),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Flexible stoneSelect() {
    return Flexible(
      flex: 3,
      fit: FlexFit.loose,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return widget.player1Stones != "lib/assets/images/tas${index + 1}.png"
              ? GestureDetector(
                  onTap: () {
                    selectStone = "lib/assets/images/tas${index + 1}.png";

                    for (int i = 0; i < selectStoneNumber.length; i++) {
                      selectStoneNumber[i] = false;
                    }
                    selectStoneNumber[index] = true;

                    setState(() {});
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      border: selectStoneNumber[index] == false
                          ? Border.all(color: Colors.grey, width: 3)
                          : Border.all(color: Colors.green, width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image:
                            AssetImage("lib/assets/images/tas${index + 1}.png"),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    /* selectStone = "lib/assets/images/tas${index + 1}.png";

              for (int i = 0; i < selectStoneNumber.length; i++) {
                selectStoneNumber[i] = false;
              }
              selectStoneNumber[index] = true;

              setState(() {});*/
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      border: selectStoneNumber[index] == false
                          ? Border.all(color: Colors.red, width: 3)
                          : Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image:
                            AssetImage("lib/assets/images/tas${index + 1}.png"),
                      ),
                    ),
                  ),
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
          Text(
            "Oyuncu 2",
            style: TextStyle(
              wordSpacing: -7,
              fontFamily: "Playbill",
              color: Colors.white,
              fontSize: 45,
            ),
          ),
        ],
      ),
    );
  }
}
