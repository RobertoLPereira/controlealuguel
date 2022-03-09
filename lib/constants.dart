import 'package:flutter/material.dart';

class Constants {
  static const double kPadding = 10.0;
  static const Color purpleLight = Color(0XFF1e224c);
  static const Color purpleDark = Color(0XFF0d193e);
  static const Color orange = Color(0XFFec8d2f);
  static const Color red = Color(0XFFf44336);

  static const Color kPrimaryColor = Colors.blueAccent;
  static const Color kShadowColor = Colors.amber;
  static const Color kBlackColor = Colors.black12;
  static const Color kSubtitleColor = Colors.cyan;
  static const Color kSecondaryColor = Colors.white;
  static const Color kBorderColor = Colors.green;

  final TextStyle kTitleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: kBlackColor,
  );

  final TextStyle kDescriptionStyle = TextStyle(
    color: kSubtitleColor,
    fontSize: 13,
  );
}

class MQuery {
  static double width = 0.0;
  static double height = 0.0;

  void init(BuildContext context) {
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
  }
}
