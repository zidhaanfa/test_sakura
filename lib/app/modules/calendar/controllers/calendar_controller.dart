import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController {
  //TODO: Implement CalendarController

  final count = 0.obs;
  late DateTime startDate = DateTime.now().withoutTime;
  late DateTime endDate = DateTime.now().withoutTime;

  DateTime? startTime;
  DateTime? endTime;

  Color colora = Colors.blue;

  final form = GlobalKey<FormState>();

  late final descriptionController = TextEditingController();
  late final titleController = TextEditingController();
  late final titleNode = FocusNode();
  late final descriptionNode = FocusNode();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
