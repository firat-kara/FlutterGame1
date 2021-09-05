//@dart=2.9
import 'package:bestasfinal2/screens_bloc/screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameControl {
  List floorList;
  String playerString;
  String oldPlayerString;
  String floor;
  var context;
  int slam;

  GameControl({this.floorList, this.playerString, this.context, this.slam,this.oldPlayerString,this.floor}) {

    debugPrint("kurucuya girdi");
    //debugPrint("$floorList");
    //debugPrint(playerString);
    int sayac = 0;
    for (int j = 0; j <= 63; j += 8) {
      //sağlı sollu
      // debugPrint("j döngüsü döndü: $j");
      for (int i = j; i <= 7 + j; i++) {
        // debugPrint("i döngüsü döndü: $i");
        if (floorList[i] == playerString) {
          sayac++;
          if (sayac == 5) {
            //oyun bitir
            GameOver(
                slam: slam,
                winnerStone: playerString,
                context: context,
                loserStone: oldPlayerString,
            floor: floor);
            debugPrint("****oyun bitti **** " + sayac.toString());
            debugPrint("****oyun bitiren taş **** " + playerString);
          }
        } else {
          sayac = 0;
        }


      }

    }
    sayac = 0;

    for (int j = 0; j <= 7; j++) {
      //altlı-üstlü
      // debugPrint("j döngüsü döndü: $j");
      for (int i = j; i <= 63 + j; i += 8) {
        // debugPrint("i döngüsü döndü: $i");
        if (floorList[i] == playerString) {
          sayac++;
          if (sayac == 5) {
            //oyun bitir
            GameOver(
                slam: slam,
                winnerStone: playerString,
                context: context,
                loserStone: oldPlayerString,
                floor: floor);
            debugPrint("****oyun bitti **** " + sayac.toString());
            debugPrint("****oyun bitiren taş **** " + playerString);
          }
        } else {
          sayac = 0;
        }
      }
    }

    sayac = 0;
    for (int i = 24; i <= 60; i += 9) {
      //çapraz1
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 16; i <= 61; i += 9) {
      //çapraz2
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 8; i <= 62; i += 9) {
      //çapraz3
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 0; i <= 63; i += 9) {
      //çapraz4
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 1; i <= 55; i += 9) {
      //çapraz5
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }
    sayac = 0;
    for (int i = 2; i <= 47; i += 9) {
      //çapraz6
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 3; i <= 39; i += 9) {
      //çapraz7
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 4; i <= 32; i += 7) {
      //çapraz8
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 5; i <= 40; i += 7) {
      //çapraz8
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 6; i <= 48; i += 7) {
      //çapraz9
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 7; i <= 56; i += 7) {
      //çapraz10
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 15; i <= 57; i += 7) {
      //çapraz11
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 23; i <= 58; i += 7) {
      //çapraz12
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }

    sayac = 0;
    for (int i = 31; i <= 59; i += 7) {
      //çapraz13
      // debugPrint("i döngüsü döndü: $i");
      if (floorList[i] == playerString) {
        sayac++;
        if (sayac == 5) {
          //oyun bitir
          GameOver(
              slam: slam,
              winnerStone: playerString,
              context: context,
              loserStone: oldPlayerString,
              floor: floor);
          debugPrint("****oyun bitti **** " + sayac.toString());
          debugPrint("****oyun bitiren taş **** " + playerString);
        }
      } else {
        sayac = 0;
      }
    }
  }
}

class GameOver {
  String winnerStone;
  String loserStone;
  String floor;
  int slam;

  var context;

  GameOver({this.winnerStone, this.loserStone, this.slam, this.context,this.floor}) {
    var routerProvider = BlocProvider.of<ScreenBloc>(context);
    routerProvider.add(WinnerScreenEvent(
        slam: slam, player1Stone: winnerStone, player2Stone: loserStone,floor:floor ));
  }
}
