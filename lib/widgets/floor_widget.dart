//@dart=2.9
import 'package:bestasfinal2/backgroud_image_changed_bloc/back_groud_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({Key key}) : super(key: key);

  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    var backGroundProvider = BlocProvider.of<BackGroudImageBloc>(context);
    return BlocBuilder<BackGroudImageBloc, BackGroudImageState>(
      bloc:backGroundProvider ,
      builder: (context, state) {
        return Container(
          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: (state as ImageChangedState).myPositions[0],
              end: (state as ImageChangedState).myPositions[1],
              //pozisyon gelecek
              colors: (state as ImageChangedState).myColors,
            ),
          ),
          child: Container(),
        );
      },
    );
  }
}
