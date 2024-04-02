import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/widgets/ZF_ElevatedButton.dart';
import '../../../config/base_data.dart';
import '../../calendar/views/calendar_day_view.dart';
import '../../calendar/views/calendar_month_view.dart';
import '../../calendar/views/calendar_week_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ZFElevatedButton(
                onPressed: () {
                  Get.to(() => CalendarDayView());
                },
                color: ZFButtonColors.buttonColorBlue,
                radius: 25,
                name: 'Day View',
                height: 50,
                width: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ZFElevatedButton(
                onPressed: () {
                  Get.to(() => CalendarWeekView());
                },
                color: ZFButtonColors.buttonColorBlue,
                radius: 25,
                name: 'Week View',
                height: 50,
                width: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ZFElevatedButton(
                onPressed: () {
                  Get.to(() => CalendarMonthView());
                },
                color: ZFButtonColors.buttonColorBlue,
                radius: 25,
                name: 'Month View',
                height: 50,
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
