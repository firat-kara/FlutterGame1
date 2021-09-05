//@dart=2.9
import 'package:bestasfinal2/screens_bloc/screen_bloc.dart';
import 'package:bestasfinal2/sound_bloc/sound_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'backgroud_image_changed_bloc/back_groud_image_bloc.dart';
import 'ekranlar/game_play_screen.dart';
import 'ekranlar/how_to_play_screen.dart';
import 'ekranlar/player1_screen.dart';
import 'ekranlar/player2_screen.dart';
import 'ekranlar/start_screen.dart';
import 'ekranlar/winner_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<bool>('sound');
  await Hive.openBox<int>('back');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<BackGroudImageBloc>(
        create: (BuildContext context) => BackGroudImageBloc(),
      ),
      BlocProvider<SoundBloc>(
        create: (BuildContext context) => SoundBloc(),
      ),
      BlocProvider<ScreenBloc>(
        create: (BuildContext context) => ScreenBloc(),
      ),
    ], child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:RouterScreenBloc(),
    );
  }
}

class RouterScreenBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routerScreen = BlocProvider.of<ScreenBloc>(context);
   return BlocBuilder(
      bloc: routerScreen,
      builder: (context, state) {
        if (state is StartScreenState) {
          return StartScreen();
        }
        if (state is HowToPlayScreenState) {
          return HowToPlayScreen();
        }
        if (state is Player1ScreenState) {
          return Player1Screen();
        }
        if (state is Player2ScreenState) {
          return Player2Screen(
            player1SelectFloor: state.player1SelectFloor,
            player1Stones: state.player1Stone,
          );
        }
        if (state is GamePlayScreenState) {
          return GamePlayeScreen(
            player1Stones: state.player1Stone,
            player2Stones: state.player2Stone,
            player1SelectFloor: state.player1SelectFloor,
          );
        }
        if (state is WinnerScreenState) {
          return WinnerScreen(
            player1Stones: state.player1Stone,
            player2Stones: state.player2Stone,
            slam: state.slam,
            floor: state.floor,
          );
        }
        else{
          return Text("Hata");
        }
      },
    );
  }
}
