import 'package:beebeer_app2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.beebeerLogoL,
        height: 30,
      ),
      centerTitle: true,
    );
  }
}
