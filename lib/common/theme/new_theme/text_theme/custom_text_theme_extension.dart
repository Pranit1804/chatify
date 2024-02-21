import 'package:flutter/material.dart';

@immutable
class CustomTextTheme extends ThemeExtension<CustomTextTheme> {
  const CustomTextTheme({
    this.displaySuper,
    this.displayLabel,
    this.display3XLSB,
    this.display3XLR,
    this.display2XLSB,
    this.display2XLR,
    this.displayXLSB,
    this.displayXLR,
    this.displayLSB,
    this.displayLR,
    this.displayMSB,
    this.displayMR,
    this.displaySSB,
    this.displaySR,
    this.displayXSSB,
    this.displayXSR,
    this.display2XSSB,
    this.display2XSR,
    this.display3XSSB,
    this.display3XSR,
    this.summary,
    this.heading1,
    this.heading1C,
    this.heading2R,
    this.heading2M,
    this.heading2B,
    this.bodyXLR,
    this.bodyXLM,
    this.bodyXLB,
    this.bodyLR,
    this.bodyLM,
    this.bodyLB,
    this.bodyMR,
    this.bodyMM,
    this.bodyMB,
    this.bodySR,
    this.bodySM,
    this.bodySB,
    this.bodyXSR,
    this.bodyXSM,

    //underlined
  });

  final TextStyle? displaySuper;
  final TextStyle? displayLabel;
  final TextStyle? display3XLSB;
  final TextStyle? display3XLR;
  final TextStyle? display2XLSB;
  final TextStyle? display2XLR;
  final TextStyle? displayXLSB;
  final TextStyle? displayXLR;
  final TextStyle? displayLSB;
  final TextStyle? displayLR;
  final TextStyle? displayMSB;
  final TextStyle? displayMR;
  final TextStyle? displaySSB;

  final TextStyle? displaySR;
  final TextStyle? displayXSSB;
  final TextStyle? displayXSR;
  final TextStyle? display2XSSB;
  final TextStyle? display2XSR;
  final TextStyle? display3XSSB;
  final TextStyle? display3XSR;

  final TextStyle? summary;
  final TextStyle? heading1;
  final TextStyle? heading1C;
  final TextStyle? heading2R;
  final TextStyle? heading2M;
  final TextStyle? heading2B;
  final TextStyle? bodyXLR;
  final TextStyle? bodyXLM;
  final TextStyle? bodyXLB;
  final TextStyle? bodyLR;

  final TextStyle? bodyLM;

  final TextStyle? bodyLB;

  final TextStyle? bodyMR;

  final TextStyle? bodyMM;

  final TextStyle? bodyMB;

  final TextStyle? bodySR;

  final TextStyle? bodySM;

  final TextStyle? bodySB;

  final TextStyle? bodyXSR;

  final TextStyle? bodyXSM;

  @override
  CustomTextTheme copyWith({
    TextStyle? displaySuper,
    TextStyle? displayLabel,
    TextStyle? display3XLSB,
    TextStyle? display3XLSB1,
    TextStyle? display3XLR,
    TextStyle? display2XLSB,
    TextStyle? display2XLSB1,
    TextStyle? display2XLR,
    TextStyle? displayXLSB,
    TextStyle? displayXLR,
    TextStyle? displayLSB,
    TextStyle? displayLSB1,
    TextStyle? displayLR,
    TextStyle? displayMSB,
    TextStyle? displayMSB1,
    TextStyle? displayMR,
    TextStyle? displayMR1,
    TextStyle? displaySSB,
    TextStyle? displaySSB1,
    TextStyle? displaySSB2,
    TextStyle? displaySR,
    TextStyle? displayXSSB,
    TextStyle? displayXSR,
    TextStyle? displayXSR1,
    TextStyle? display2XSSB,
    TextStyle? display2XSR,
    TextStyle? display3XSSB,
    TextStyle? display3XSR,
    TextStyle? summary,
    TextStyle? heading1,
    TextStyle? heading1C,
    TextStyle? heading2R,
    TextStyle? heading2M,
    TextStyle? heading2B,
    TextStyle? bodyXLR,
    TextStyle? bodyXLM,
    TextStyle? bodyXLB,
    TextStyle? bodyLR,
    TextStyle? bodyLR1,
    TextStyle? bodyLR2,
    TextStyle? bodyLR3,
    TextStyle? bodyLM,
    TextStyle? bodyLM1,
    TextStyle? bodyLM2,
    TextStyle? bodyLB,
    TextStyle? bodyLB1,
    TextStyle? bodyLB2,
    TextStyle? bodyMR,
    TextStyle? bodyMR1,
    TextStyle? bodyMR2,
    TextStyle? bodyMR3,
    TextStyle? bodyMR4,
    TextStyle? bodyMR5,
    TextStyle? bodyMR6,
    TextStyle? bodyMR7,
    TextStyle? bodyMR8,
    TextStyle? bodyMR9,
    TextStyle? bodyMM,
    TextStyle? bodyMM1,
    TextStyle? bodyMM2,
    TextStyle? bodyMM3,
    TextStyle? bodyMM4,
    TextStyle? bodyMM5,
    TextStyle? bodyMM6,
    TextStyle? bodyMM7,
    TextStyle? bodyMB,
    TextStyle? bodyMB1,
    TextStyle? bodySR,
    TextStyle? bodySR1,
    TextStyle? bodySR2,
    TextStyle? bodySR3,
    TextStyle? bodySR4,
    TextStyle? bodySR5,
    TextStyle? bodySR6,
    TextStyle? bodySM,
    TextStyle? bodySM1,
    TextStyle? bodySM2,
    TextStyle? bodySM3,
    TextStyle? bodySM4,
    TextStyle? bodySB,
    TextStyle? bodySB1,
    TextStyle? bodySB2,
    TextStyle? bodySB3,
    TextStyle? bodyXSR,
    TextStyle? bodyXSR1,
    TextStyle? bodyXSR2,
    TextStyle? bodyXSR3,
    TextStyle? bodyXSM,
    TextStyle? bodyXSM1,
    TextStyle? bodyXSM2,
    TextStyle? bodyXSM3,
  }) {
    return CustomTextTheme(
      displaySuper: displaySuper,
      displayLabel: displayLabel,
      display3XLSB: display3XLSB,
      display3XLR: display3XLR,
      display2XLSB: display2XLSB,
      display2XLR: display2XLR,
      displayXLSB: displayXLSB,
      displayXLR: displayXLR,
      displayLSB: displayLSB,
      displayLR: displayLR,
      displayMSB: displayMSB,
      displayMR: displayMR,
      displaySSB: displaySSB,
      displaySR: displaySR,
      displayXSSB: displayXSSB,
      displayXSR: displayXSR,
      display2XSSB: display2XSSB,
      display2XSR: display2XSR,
      display3XSSB: display3XSSB,
      display3XSR: display3XSR,
      summary: summary,
      heading1: heading1,
      heading1C: heading1C,
      heading2R: heading2R,
      heading2M: heading2M,
      heading2B: heading2B,
      bodyXLR: bodyXLR,
      bodyXLM: bodyXLM,
      bodyXLB: bodyXLB,
      bodyLR: bodyLR,
      bodyLM: bodyLM,
      bodyLB: bodyLB,
      bodyMR: bodyMR,
      bodyMM: bodyMM,
      bodyMB: bodyMB,
      bodySR: bodySR,
      bodySM: bodySM,
      bodySB: bodySB,
      bodyXSR: bodyXSR,
      bodyXSM: bodyXSM,
    );
  }

  @override
  CustomTextTheme lerp(ThemeExtension<CustomTextTheme>? other, double t) {
    if (other is! CustomTextTheme) {
      return this;
    }
    return CustomTextTheme(
      displaySuper: TextStyle.lerp(displaySuper, other.displaySuper, t),
      displayLabel: TextStyle.lerp(displayLabel, other.displayLabel, t),
      display3XLSB: TextStyle.lerp(display3XLSB, other.display3XLSB, t),
      display3XLR: TextStyle.lerp(display3XLR, other.display3XLR, t),
      display2XLSB: TextStyle.lerp(display2XLSB, other.display2XLSB, t),
      display2XLR: TextStyle.lerp(display2XLR, other.display2XLR, t),
      displayXLSB: TextStyle.lerp(displayXLSB, other.displayXLSB, t),
      displayXLR: TextStyle.lerp(displayXLR, other.displayXLR, t),
      displayLSB: TextStyle.lerp(displayLSB, other.displayLSB, t),
      displayLR: TextStyle.lerp(displayLR, other.displayLR, t),
      displayMSB: TextStyle.lerp(displayMSB, other.displayMSB, t),
      displayMR: TextStyle.lerp(displayMR, other.displayMR, t), //
      displaySSB: TextStyle.lerp(displaySSB, other.displaySSB, t),

      displaySR: TextStyle.lerp(displaySR, other.displaySR, t),
      displayXSSB: TextStyle.lerp(displayXSSB, other.displayXSSB, t),
      displayXSR: TextStyle.lerp(displayXSR, other.displayXSR, t),
      display2XSSB: TextStyle.lerp(display2XSSB, other.display2XSSB, t),
      display2XSR: TextStyle.lerp(display2XSR, other.display2XSR, t),
      display3XSSB: TextStyle.lerp(display3XSSB, other.display3XSSB, t),
      display3XSR: TextStyle.lerp(display3XSR, other.display3XSR, t),
      summary: TextStyle.lerp(summary, other.summary, t),
      heading1: TextStyle.lerp(heading1, other.heading1, t),
      heading1C: TextStyle.lerp(heading1C, other.heading1C, t),
      heading2R: TextStyle.lerp(heading2R, other.heading2R, t),
      heading2M: TextStyle.lerp(heading2M, other.heading2M, t),
      heading2B: TextStyle.lerp(heading2B, other.heading2B, t),
      bodyXLR: TextStyle.lerp(bodyXLR, other.bodyXLR, t),
      bodyXLM: TextStyle.lerp(bodyXLM, other.bodyXLM, t),
      bodyXLB: TextStyle.lerp(bodyXLB, other.bodyXLB, t),
      bodyLR: TextStyle.lerp(bodyLR, other.bodyLR, t),

      bodyLM: TextStyle.lerp(bodyLM, other.bodyLM, t),

      bodyLB: TextStyle.lerp(bodyLB, other.bodyLB, t),

      bodyMR: TextStyle.lerp(bodyMR, other.bodyMR, t),

      bodyMM: TextStyle.lerp(bodyMM, other.bodyMM, t),

      bodyMB: TextStyle.lerp(bodyMB, other.bodyMB, t),
      bodySR: TextStyle.lerp(bodySR, other.bodySR, t),

      bodySM: TextStyle.lerp(bodySM, other.bodySM, t),

      bodySB: TextStyle.lerp(bodySB, other.bodySB, t),

      bodyXSR: TextStyle.lerp(bodyXSR, other.bodyXSR, t),

      bodyXSM: TextStyle.lerp(bodyXSM, other.bodyXSM, t),
    );
  }

  @override
  String toString() => 'MyCardTheme('
      'background: $displaySuper, radius: $displaySuper'
      ')';
}
