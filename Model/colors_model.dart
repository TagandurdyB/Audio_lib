// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class ThemeColor {
  Color appBar = const Color(0xffD3756B);
  Color appBarIcon = Colors.black;
  Color text = Colors.black;
  Color canvas = const Color(0xffA77979);
  Color navigationBg = const Color(0xffF2F2F2);
  Color navigatActiveIcon = const Color(0xffDADADA);
  Color navigatUnactiveIcon = Colors.grey;
}

class ThemeDarkColor extends ThemeColor {
  @override
  Color appBar = const Color(0xff4C1C18);
  @override
  Color appBarIcon = Colors.white;
  @override
  Color text = Colors.white;
  @override
  Color canvas = const Color(0xff472D2D);
  @override
  Color navigationBg = const Color.fromARGB(255, 48, 46, 46);
  @override
  Color navigatActiveIcon = Colors.white;
  @override
  Color navigatUnactiveIcon = Colors.grey;
}
