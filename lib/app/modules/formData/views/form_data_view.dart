import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/form_data_controller.dart';

class FormDataView extends GetView<FormDataController> {
  const FormDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormDataView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FormDataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
