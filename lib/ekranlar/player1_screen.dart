//@dart=2.9
import 'package:bestasfinal2/screens_bloc/screen_bloc.dart';
import 'package:bestasfinal2/widgets/floor_widget.dart';
import 'package:bestasfinal2/widgets/home_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Player1Screen extends StatefulWidget {
  const Player1Screen({Key key}) : super(key: key);

  @override
  _Player1ScreenState createState() => _Player1ScreenState();
}

class _Player1ScreenState extends State<Player1Screen> {
  String selectStone;

  String selectBackGround;

  List<bool> selectBackgroudNumber=List.filled(24, false);
  List<bool> selectStoneNumber=List.filled(20, false);



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
              backgroundSelect(),
              stoneSelect(),
              controlBoard(),
              goTo2Player(routerProvider)
            ],
          )
        ],
      ),
    ));
  }

  Container goTo2Player(ScreenBloc routerProvider) {
    return Container(
      margin: EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          //oyuncu 2 ye git

          if (selectStone != null && selectBackGround != null) {
            routerProvider.add(Player2ScreenEvent(
                player1Stone: selectStone,
                player1SelectFloor: selectBackGround));
          }
        },
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }

  Flexible controlBoard() {
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
            image: selectBackGround != null
                ? AssetImage(selectBackGround)
                : AssetImage("lib/assets/images/arrow.png"),
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
                        : AssetImage("lib/assets/images/click.png"),
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
          return GestureDetector(
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
                  image: AssetImage("lib/assets/images/tas${index + 1}.png"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Flexible backgroundSelect() {
    return Flexible(
      flex: 3,
      fit: FlexFit.loose,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 24,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectBackGround = "lib/assets/images/zemin${index + 1}.jpeg";
              for (int i = 0; i < selectBackgroudNumber.length; i++) {
                selectBackgroudNumber[i] = false;
              }
              selectBackgroudNumber[index] = true;

              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: selectBackgroudNumber[index] == false
                    ? Border.all(color: Colors.grey, width: 3)
                    : Border.all(color: Colors.green, width: 3),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.teal,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("lib/assets/images/zemin${index + 1}.jpeg"),
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
            "Oyuncu 1",
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
