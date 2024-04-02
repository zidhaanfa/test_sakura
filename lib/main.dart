import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_sakura/app/config/base_data.dart';

import 'app/routes/app_pages.dart';

DateTime get _now => DateTime.now();
void main() {
  runApp(
    Main(),
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController()..addAll(_events),
      child: GetMaterialApp(
        title: "PT Sakura System Solutions",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}

List<CalendarEventData> _events = [
  CalendarEventData(
    color: ZFOtherColors.green,
    date: _now,
    title: "Meeting PT Sakura System Solutions",
    description: "Interview Project.",
    startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
];
