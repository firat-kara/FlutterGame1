//@dart=2.9
import 'package:bestasfinal2/backgroud_image_changed_bloc/back_groud_image_bloc.dart';
import 'package:bestasfinal2/screens_bloc/screen_bloc.dart';
import 'package:bestasfinal2/sound_bloc/sound_bloc.dart';
import 'package:bestasfinal2/widgets/floor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}



class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class _StartScreenState extends State<StartScreen> {
  final soundBox = Hive.box<bool>('sound');
  final imageBox = Hive.box<int>('back');
  var backgroudClick = false;
  var isThereSound=true;
  var counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     isThereSound = soundBox.get('sound', defaultValue: true);
     counter=imageBox.get('back', defaultValue: 0);
     debugPrint(counter.toString());
  }



  List<List<Color>> myColors = [
    [HexColor("#434343"), HexColor("#000000")],
    [HexColor("#000000"), HexColor("#d0021b")],
    [HexColor("#28313b"), HexColor("#485461")],
    [HexColor("#E3E3E3"), HexColor("#5D6874")],
    [HexColor("#DFEC51"), HexColor("#73AA0A")],
    [HexColor("#007bff"), HexColor("#d0021b")],
    [HexColor("#04619f"), HexColor("#000000")],
    [HexColor("#656d77"), HexColor("#2f363f")],
    [HexColor("#b1ea4d"), HexColor("#459522")],
    [HexColor("#c3ec52"), HexColor("#0ba29d")],
    [HexColor("#2c3e50"), HexColor("#000000")],
    [HexColor("#0FF0B3"), HexColor("#036ED9")],
    [HexColor("#e35c67"), HexColor("#381ce2")],
    [HexColor("#13f1fc"), HexColor("#0470dc")],
    [HexColor("#7f8c8d"), HexColor("#000000")],
    [HexColor("#09203f"), HexColor("#537895")],
    [HexColor("#f05e57"), HexColor("#36093f")],
    [HexColor("#C56CD6"), HexColor("#3425AF")],
    [HexColor("#FF57B9"), HexColor("#A704FD")],
    [HexColor("#000000"), HexColor("#e84393")],
    [HexColor("#F36265"), HexColor("#961276")],
    [HexColor("#F5515F"), HexColor("#A1051D")],
    [HexColor("#f2d50f"), HexColor("#da0641")],
    [HexColor("#fad961"), HexColor("#f76b1c")],
    [HexColor("#5b247a"), HexColor("#1bcedf")],
    [HexColor("#184e68"), HexColor("#57ca85")],
    [HexColor("#65799b"), HexColor("#5e2563")],
    [HexColor("#42e695"), HexColor("#3bb2b8")],
    [HexColor("#f65599"), HexColor("#f38381")],
  ];
  List<List<Alignment>> myPos = [
    [Alignment.topLeft, Alignment.bottomRight],
  ];



  Widget build(BuildContext context) {



    var routerProvider = BlocProvider.of<ScreenBloc>(context);
    var colorsProvider = BlocProvider.of<BackGroudImageBloc>(context);
    var soundProvider = BlocProvider.of<SoundBloc>(context);
    colorsProvider.add(
      ImageChangedEvent(
        myPositions: myPos[0],
        myColors: myColors[counter],
      ),
    );
    soundProvider.add(
    SoundBoolEvent(sound: isThereSound)
    );

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundWidget(),
            playButton(routerProvider),
            howToPlay(routerProvider),
            soundStatus(context,soundProvider),
            backgroudChange(colorsProvider)
          ],
        ),
      ),
    );
  }

  Positioned backgroudChange(BackGroudImageBloc colorsProvider) {
    return Positioned(
      bottom: 15,
      right: 15,
      child: GestureDetector(
        onTap: () {
          backgroudClick = true;
          setState(() {});
        },
        child: backgroudClick == false
            ? Icon(
                Icons.photo,
                color: Colors.white,
                size: 45,
              )
            : Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //sol
                      if (counter != 0) {
                        counter--;
                        imageBox.put('back', counter);
                        colorsProvider.add(ImageChangedEvent(
                            myPositions: myPos[0],
                            myColors: myColors[counter]));
                        debugPrint(counter.toString());
                      }
                    },
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //sağ
                      if (counter != myColors.length - 1) {
                        counter++;
                        imageBox.put('back', counter);
                        colorsProvider.add(
                          ImageChangedEvent(
                            myPositions: myPos[0],
                            myColors: myColors[counter],
                          ),
                        );
                        debugPrint(counter.toString());
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Positioned soundStatus(BuildContext context, SoundBloc soundProvider) {

    return Positioned(
      bottom: 15,
      left: 15,
      child: GestureDetector(
        onTap: () {
          //ses aç kapat
          isThereSound = !isThereSound;
          soundBox   .put('sound', isThereSound);
          soundProvider.add(SoundBoolEvent(sound: isThereSound));
          setState(() {});
        },
        child: isThereSound == false
            ? Icon(
                Icons.flutter_dash_sharp,
                color: Colors.grey,
                size: 45,
              )
            : Icon(
                Icons.flutter_dash_sharp,
                color: Colors.green,
                size: 45,
              ),
      ),
    );
  }

  Positioned howToPlay(ScreenBloc routerProvider) {
    return Positioned(
      top: 15,
      right: 15,
      child: GestureDetector(
        onTap: () {
          //nasıl oynanır ekranına git
          routerProvider.add(HowToPlayScreenEvent());
        },
        child: Icon(
          Icons.help_center_outlined,
          color: Colors.white,
          size: 45,
        ),
      ),
    );
  }

  Widget playButton(ScreenBloc routerProvider) {
    return Positioned(
      top: 0,
      bottom: 0,
      right: 0,
      left: 0,
      child: GestureDetector(
        onTap: () {
          //oyuncu 1 ekranına gönder
          routerProvider.add(Player1ScreenEvent());
        },
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
