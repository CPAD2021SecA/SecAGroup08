import 'package:flutter/cupertino.dart';

class OrientationUtil {

  static getWidth(BuildContext context, double portrait, double landscape){
    return MediaQuery.of(context).orientation == Orientation.landscape ?
    MediaQuery.of(context).size.width * landscape :
    MediaQuery.of(context).size.width * portrait;
  }

  static getHeight(BuildContext context, double portrait, double landscape){
  return MediaQuery.of(context).orientation == Orientation.landscape ?
  MediaQuery.of(context).size.height * landscape :
  MediaQuery.of(context).size.height * portrait;
  }
}