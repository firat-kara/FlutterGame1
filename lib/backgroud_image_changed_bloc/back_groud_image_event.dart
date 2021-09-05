//@dart=2.9
part of 'back_groud_image_bloc.dart';

@immutable
abstract class BackGroudImageEvent {}
class ImageChangedEvent extends BackGroudImageEvent{
  List<Alignment> myPositions;
  List<Color> myColors;
  ImageChangedEvent({this.myPositions,this.myColors});
}
