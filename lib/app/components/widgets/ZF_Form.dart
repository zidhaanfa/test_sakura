import 'package:flutter/material.dart';

import '../../config/base_data.dart';

class ZFForm extends StatelessWidget {
  ZFForm({
    Key? key,
    required this.name,
    required this.controller,
    this.icon,
    required this.enabled,
    required this.keyboardType,
    required this.obsecure,
    required this.height,
    this.suffixIconOnPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.maxlines,
  }) : super(key: key);

  TextEditingController controller;
  String name;
  IconData? icon;
  bool obsecure;
  bool? enabled;
  TextInputType? keyboardType;
  double height;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Function()? suffixIconOnPressed;
  bool? readOnly;
  int? maxlines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: height,
        child: TextFormField(
          maxLines: maxlines ?? 1,
          readOnly: readOnly ?? false,
          controller: controller,
          obscureText: obsecure,
          enabled: enabled ?? true,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: name,
            labelText: name,
            border: OutlineInputBorder(),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: ZFOtherColors.grey,
                    size: 24,
                  )
                : SizedBox(
                    width: 5,
                    height: 0,
                  ),
            suffix: suffixIcon != null
                ? IconButton(
                    icon: Icon(
                      suffixIcon,
                      color: ZFOtherColors.red,
                      size: 24,
                    ),
                    onPressed: suffixIconOnPressed ?? () {},
                  )
                : SizedBox(
                    width: 15,
                    height: 15,
                  ),
          ),
        ),
      ),
    );
  }
}
