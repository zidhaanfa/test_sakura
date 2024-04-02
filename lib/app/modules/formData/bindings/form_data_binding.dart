import 'package:get/get.dart';

import '../controllers/form_data_controller.dart';

class FormDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormDataController>(
      () => FormDataController(),
    );
  }
}
