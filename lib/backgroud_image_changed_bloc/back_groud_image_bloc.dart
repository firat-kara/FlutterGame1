//@dart=2.9
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'back_groud_image_event.dart';

part 'back_groud_image_state.dart';

class BackGroudImageBloc
    extends Bloc<BackGroudImageEvent, BackGroudImageState> {
  BackGroudImageBloc()
      : super(
          ImageChangedState(myColors: [
            //renkler gelecek
            Color.fromRGBO(22, 34, 75, 1),
            Color.fromRGBO(0, 0, 0, 1),
          ], myPositions: [
            Alignment.topLeft,
            Alignment.bottomRight
          ]),
        );

  @override
  Stream<BackGroudImageState> mapEventToState(
    BackGroudImageEvent event,
  ) async* {
    if (event is ImageChangedEvent) {
      yield ImageChangedState(
          myColors: event.myColors, myPositions: event.myPositions);
    }
  }
}
