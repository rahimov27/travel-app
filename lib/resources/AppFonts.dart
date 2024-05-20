import 'package:flutter/material.dart';

abstract class AppFonts {
  static const TextStyle title1 = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xffD9D9D9));
  static const TextStyle title2 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xffFFFFFF));
  static const TextStyle minsk =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);
  static const TextStyle turkish = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff9F9F9F));
  static const TextStyle title3 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);

  static const TextStyle text2 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);

  static const TextStyle buttonText1 = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.italic,
    color: Colors.white,
  );

  static const TextStyle title4 =
      TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.white);
}
