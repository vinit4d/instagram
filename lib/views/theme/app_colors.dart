import 'package:flutter/material.dart';

class AppColors {
  Color get appColor => "#7633FF".toColor();

  Color get containerBgColor => "#F8F8F8".toColor();

  Color get bottomIconColor => "#FFFFFF".toColor();

  Color get greenColor => "#0C9F2C".toColor();

  Color get chipColor => "#DAD8D8".toColor();

  Color get ratingColor => "#FFA800".toColor();

  Color get noteColor => "#F3893D".toColor();

  Color get primary => Colors.black;

  Color get whiteColor => Colors.white;

  Color get hintColor => Colors.grey.shade700;

  Color get splashLoader => Colors.green;

  Color get background => Colors.green.shade100;

  Color get wizardColor => Colors.blue.shade100;

  Color get blueColor => Colors.blue;

  Color get contactColor => Colors.teal.shade100;

  Color get contactShadeColor => Colors.teal.withOpacity(0.08);

  Color get textFormFieldColor => Colors.grey.shade600;
}

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
