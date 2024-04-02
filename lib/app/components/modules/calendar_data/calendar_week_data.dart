import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sakura/app/config/base_data.dart';

import '../../../modules/calendar/bindings/calendar_binding.dart';
import '../../../modules/calendar/views/calendar_detail_view.dart';

class CalendarWeekData extends StatelessWidget {
  const CalendarWeekData({Key? key, this.stateWeek, this.width});
  final GlobalKey<WeekViewState>? stateWeek;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return WeekView(
      key: stateWeek,
      width: width,
      showLiveTimeLineInAllDays: true,
      timeLineWidth: 65,
      liveTimeIndicatorSettings: LiveTimeIndicatorSettings(
        color: Colors.redAccent,
        showTime: true,
      ),
      headerStyle: HeaderStyle(
          decoration: BoxDecoration(
        color: ZFOtherColors.green.withOpacity(0.4),
      )),
      onEventTap: (event, date) {
        Get.to(
          () => CalendarDetailView(
            event: event.first,
          ),
          binding: CalendarBinding(),
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (_) => CalendarDetailView(
        //       event: events.first,
        //     ),
        //   ),
        // );
      },
    );
  }
}
