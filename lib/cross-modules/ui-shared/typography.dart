library com.rick_and_morty.ui_shared.typography;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypoBase {
  static TextStyle get nunitoBold => GoogleFonts.nunito(
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      );

  static TextStyle get nunitoSemiBold => GoogleFonts.nunito(
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  static TextStyle get nunitoMedium => GoogleFonts.nunito(
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      );

  static TextStyle get nunitoRegular => GoogleFonts.nunito(
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );
}

class DisplayTextStyle {
  static TextStyle display3 = TypoBase.nunitoMedium.copyWith(
    fontSize: 40,
  );
  static TextStyle display2 = TypoBase.nunitoBold.copyWith(
    fontSize: 32,
  );
  static TextStyle display1 = TypoBase.nunitoSemiBold.copyWith(
    fontSize: 28,
  );
}

class BodyTextStyle {
  static TextStyle body1 = TypoBase.nunitoRegular.copyWith(
    fontSize: 16,
  );
  static TextStyle body2 = TypoBase.nunitoRegular.copyWith(
    fontSize: 14,
  );
}
