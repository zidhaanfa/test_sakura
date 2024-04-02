import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/base_data.dart';
import '../../config/config.dart';

class ZFText extends StatelessWidget {
  const ZFText({
    Key? key,
    required this.text,
    this.maxLines,
    required this.fontType,
    this.colorText,
    this.opacityText,
    this.weight,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final int? maxLines;
  final FontType fontType;
  final Color? colorText;
  final FontWeight? weight;
  final double? opacityText;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    double? fontSizes;
    double? iconSize;
    double? opacity = opacityText ?? 1;
    switch (fontType) {
      case FontType.displayLarge:
        fontSizes = ZFFontSizeCustom.displayLarge;
        iconSize = ZFFontSizeCustom.displayLarge + 5;
        break;
      case FontType.displayMedium:
        fontSizes = ZFFontSizeCustom.displayMedium;
        iconSize = ZFFontSizeCustom.displayMedium + 5;
        break;
      case FontType.displaySmall:
        fontSizes = ZFFontSizeCustom.displaySmall;
        iconSize = ZFFontSizeCustom.displaySmall + 5;
        break;
      case FontType.headlineLarge:
        fontSizes = ZFFontSizeCustom.headlineLarge;
        iconSize = ZFFontSizeCustom.headlineLarge + 5;
        break;
      case FontType.headlineMedium:
        fontSizes = ZFFontSizeCustom.headlineMedium;
        iconSize = ZFFontSizeCustom.headlineMedium + 5;
        break;
      case FontType.headlineSmall:
        fontSizes = ZFFontSizeCustom.headlineSmall;
        iconSize = ZFFontSizeCustom.headlineSmall + 5;
        break;
      case FontType.titleLarge:
        fontSizes = ZFFontSizeCustom.titleLarge;
        iconSize = ZFFontSizeCustom.titleLarge + 5;
        break;
      case FontType.titleMedium:
        fontSizes = ZFFontSizeCustom.titleMedium;
        iconSize = ZFFontSizeCustom.titleMedium + 5;
        break;
      case FontType.titleSmall:
        fontSizes = ZFFontSizeCustom.titleSmall;
        iconSize = ZFFontSizeCustom.titleSmall + 5;
        break;
      case FontType.bodyLarge:
        fontSizes = ZFFontSizeCustom.bodyLarge;
        iconSize = ZFFontSizeCustom.bodyLarge + 5;
        break;
      case FontType.bodyMedium:
        fontSizes = ZFFontSizeCustom.bodyMedium;
        iconSize = ZFFontSizeCustom.bodyMedium + 5;
        break;
      case FontType.bodySmall:
        fontSizes = ZFFontSizeCustom.bodySmall;
        iconSize = ZFFontSizeCustom.bodySmall + 5;
        break;
      case FontType.labelLarge:
        fontSizes = ZFFontSizeCustom.labelLarge;
        iconSize = ZFFontSizeCustom.labelLarge + 5;
        break;
      case FontType.labelMedium:
        fontSizes = ZFFontSizeCustom.labelMedium;
        iconSize = ZFFontSizeCustom.labelMedium + 5;
        break;
      case FontType.labelSmall:
        fontSizes = ZFFontSizeCustom.labelSmall;
        iconSize = ZFFontSizeCustom.labelSmall + 5;
        break;
      default:
    }
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontSize: fontSizes,
        fontWeight: weight,
        overflow: TextOverflow.ellipsis,
        color: colorText ??
            (Get.isDarkMode == true
                ? ZFTextColors.textWhite.withOpacity(opacity!)
                : ZFTextColors.textBlack.withOpacity(opacity!)),
      ),
      maxLines: maxLines ?? null,
    );
  }
}
