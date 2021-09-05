//@dart=2.9
part of 'back_groud_image_bloc.dart';

@immutable
abstract class BackGroudImageState {}



class ImageChangedState extends BackGroudImageState{
  List<Alignment> myPositions;
  List<Color> myColors;
  ImageChangedState({this.myPositions,this.myColors});
}