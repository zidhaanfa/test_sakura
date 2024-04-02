import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/modules/calendar_data/calendar_day_data.dart';
import '../controllers/calendar_controller.dart';

class CalendarDayView extends GetView<CalendarController> {
  CalendarDayView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Day'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 8,
        onPressed: () {},
      ),
      body: CalendarDayData(),
    );
  }
}
