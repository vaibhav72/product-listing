import 'package:assignment/util/meta_colors.dart';
import 'package:flutter/material.dart';

class MetaStyles {
  static BoxDecoration buildBoxDecoration(Color color) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color.withOpacity(.1),
        boxShadow: buildBoxShadow(color));
  }

  static List<BoxShadow> buildBoxShadow(Color color) {
    return [
      BoxShadow(
          color: Colors.black.withOpacity(.5),
          blurRadius: 3.0,
          spreadRadius: 3,
          offset: Offset(3, 2)),
      BoxShadow(
          color: color.withOpacity(1),
          blurRadius: 3.0,
          spreadRadius: 3.0,
          offset: Offset(-6, -2))
    ];
  }

  static BoxDecoration buildBoxDecorationForGradientContainer() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          MetaColors.primaryColor,
          MetaColors.primaryColor,
          Colors.white,
          Colors.white
        ]));
  }
}
