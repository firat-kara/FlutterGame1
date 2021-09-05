//@dart=2.9
import 'package:bestasfinal2/screens_bloc/screen_bloc.dart';
import 'package:bestasfinal2/widgets/floor_widget.dart';
import 'package:bestasfinal2/widgets/home_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HowToPlayScreen extends StatefulWidget {
  const HowToPlayScreen({Key key}) : super(key: key);

  @override
  _HowToPlayScreenState createState() => _HowToPlayScreenState();
}

class _HowToPlayScreenState extends State<HowToPlayScreen> {
  @override
  Widget build(BuildContext context) {
    var routerProvider=BlocProvider.of<ScreenBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
          BackgroundWidget(),
            howToPlayGameBoard(),
            goToHomePage(),
          ],
        ),
      ),
    );
  }

  Positioned goToHomePage() {
    return Positioned(
            left: 15,
            top: 15,
            child: homeButtonWidget(),
          );
  }

  Positioned howToPlayGameBoard() {
    return Positioned(
      top: 80,
      bottom: 15,
      right: 15,
      left: 15,
      child: Container(
        child: Image.asset(
          "lib/assets/images/howToPlayImage.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }

}

