import 'package:flutter/material.dart';

import '../../config/base_data.dart';

class ZFFormField extends StatelessWidget {
  ZFFormField({
    Key? key,
    required this.controller,
    required this.name,
    this.focusNode,
  }) : super(key: key);

  TextEditingController controller;
  FocusNode? focusNode;
  String name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: AppConstants.inputDecoration.copyWith(
        labelText: name,
      ),
      style: TextStyle(
        color: ZFOtherColors.black,
        fontSize: 15.0,
      ),
      validator: (value) {
        final title = value?.trim();

        if (title == null || title == "") return "Please enter $name.";

        return null;
      },
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}
