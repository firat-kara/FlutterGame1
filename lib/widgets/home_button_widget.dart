//@dart=2.9
import 'package:bestasfinal2/screens_bloc/screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homeButtonWidget extends StatelessWidget {
  const homeButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routerProvider=BlocProvider.of<ScreenBloc>(context);
    return GestureDetector(
      onTap: () {
        //ana Sayfaya Git
        routerProvider.add(StartScreenEvent());
      },
      child: Icon(
        Icons.home,
        size: 45,
        color: Colors.white,
      ),
    );
  }
}
