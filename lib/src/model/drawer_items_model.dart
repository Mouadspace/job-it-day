import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerItems {
  SvgPicture icon;
  String label;
  Widget screen;
  Color? screenColor;

  DrawerItems({
    required this.icon,
    required this.label,
    required this.screen,
    this.screenColor,
  });
}
