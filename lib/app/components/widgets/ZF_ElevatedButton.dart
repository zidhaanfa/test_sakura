import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/config/base_data.dart';

class ZFElevatedButton extends StatelessWidget {
  ZFElevatedButton({
    Key? key,
    required this.onPressed,
    required this.name,
    required this.height,
    required this.width,
    this.color,
    this.radius,
  }) : super(key: key);

  Function()? onPressed;
  String name;
  double width;
  double height;
  Color? color;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: radius == null
            ? null
            : MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      radius ?? 15,
                    ),
                  ),
                ),
              ),
        backgroundColor: MaterialStatePropertyAll(
          color ?? ZFButtonColors.buttonPrimaryColor,
        ),
        maximumSize: MaterialStatePropertyAll(
          Size(400, 60),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(width, height),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: ZFTextColors.textWhite,
        ),
      ),
    );
  }
}
