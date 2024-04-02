import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/base_data.dart';
import '../../../modules/calendar/bindings/calendar_binding.dart';
import '../../../modules/calendar/views/calendar_detail_view.dart';

class CalendarMonthData extends StatelessWidget {
  const CalendarMonthData({
    Key? key,
    this.stateMonth,
    this.width,
  });
  final GlobalKey<MonthViewState>? stateMonth;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MonthView(
      key: stateMonth,
      width: width,
      headerStyle: HeaderStyle(
          decoration: BoxDecoration(
        color: ZFOtherColors.green.withOpacity(0.4),
      )),
      onEventTap: (event, date) {
        Get.to(
          () => CalendarDetailView(
            event: event,
          ),
          binding: CalendarBinding(),
        );
      },
    );
  }
}
