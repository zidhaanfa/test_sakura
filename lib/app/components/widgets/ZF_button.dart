import 'package:flutter/material.dart';

import '../../config/base_data.dart';

class ZFButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ZFButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        decoration: BoxDecoration(
          color: ZFOtherColors.blue,
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: [
            BoxShadow(
              color: ZFOtherColors.black,
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: -3,
            )
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: ZFOtherColors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
