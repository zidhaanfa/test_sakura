import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sakura/app/components/modules/calendar_data/calendar_month_data.dart';

import '../../../components/functions/calendar_func/create_event.dart';
import '../../../config/base_data.dart';
import '../bindings/calendar_binding.dart';
import '../controllers/calendar_controller.dart';

class CalendarMonthView extends GetView<CalendarController> {
  CalendarMonthView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Month'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ZFButtonColors.buttonColorGreen,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        elevation: 8,
        onPressed: () {
          Get.to(
            () => CreateEvent(),
            binding: CalendarBinding(),
          );
        },
      ),
      body: CalendarMonthData(),
    );
  }
}
