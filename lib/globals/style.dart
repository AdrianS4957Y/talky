import 'package:flutter/material.dart';

import 'enum_colors.dart';

double _fontSizeMultiplier = 1;
setFontSizeMultiplier(double multiplier) {
  _fontSizeMultiplier = multiplier;
}

class Style {
  static double height = 812;
  static double width = 375;
  static Map<EColors, Map<ESelection2, Color>> t2Colors = const {
    EColors.blue: {
      ESelection2.primary: Color(0xFF377DFF),
      ESelection2.secondary: Color(0xFFE5F1FF),
    },
    EColors.green: {
      ESelection2.primary: Color(0xFF2DCA8C),
      ESelection2.secondary: Color(0xFFEAFAF3),
    },
    EColors.yellow: {
      ESelection2.primary: Color(0xFFFFBE3D),
      ESelection2.secondary: Color(0xFFFFF2D8),
    },
    EColors.red: {
      ESelection2.primary: Color(0xFFFF715B),
      ESelection2.secondary: Color(0xFFFFE3DE),
    },
  };
  static Map<EColors, Map<ESelection3, Color>> t3Colors = const {
    EColors.black: {
      ESelection3.primary: Color(0xFF243443),
      ESelection3.middle: Color(0xFF58616A),
      ESelection3.light: Color(0xFFAAB0B7),
    },
    EColors.background: {
      ESelection3.primary: Color(0xFFFFFFFF),
      ESelection3.light: Color(0xFFF7F7F9),
      ESelection3.middle: Color(0xFFF0F0F0),
    },
  };
  static roboto({
    required EColors color,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    ESelection2? t2Selection,
    ESelection3? t3Selection,
    double? fontSizeMultiplier,
    TextDecoration? decoration,
  }) {
    Color localColor = Colors.white;

    if (t3Colors[color] != null) {
      if (t3Colors[color]![t3Selection] != null) {
        localColor = t3Colors[color]![t3Selection]!;
      }
    } else if (t2Colors[color] != null) {
      if (t2Colors[color]![t2Selection] != null) {
        localColor = t2Colors[color]![t2Selection]!;
      }
    }
    return TextStyle(
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      fontSize: fontSize * (fontSizeMultiplier ?? _fontSizeMultiplier),
      color: localColor,
      decoration: decoration,
    );
  }

  static inter({
    required EColors color,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    ESelection2 t2Selection = ESelection2.primary,
    ESelection3? t3Selection,
    double? fontSizeMultiplier,
    TextDecoration? decoration,
    double? decorationThickness,
    List<Shadow>? shadows,
    Color? decorationColor,
  }) {
    Color localColor = Colors.transparent;
    if (t3Colors[color] != null) {
      if (t3Colors[color]![t3Selection] != null) {
        localColor = t3Colors[color]![t3Selection]!;
      }
    } else if (t2Colors[color] != null) {
      if (t2Colors[color]![t2Selection] != null) {
        localColor = t2Colors[color]![t2Selection]!;
      }
    }
    return TextStyle(
      fontFamily: 'Inter',
      fontWeight: fontWeight,
      fontSize: fontSize * (fontSizeMultiplier ?? _fontSizeMultiplier),
      color: localColor,
      decoration: decoration,
      decorationThickness: decorationThickness,
      shadows: shadows,
      decorationColor: decorationColor,
    );
  }
}
