import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

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
      onEventTap: (events, date) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CalendarDetailView(
              event: events.first,
            ),
          ),
        );
      },
    );
  }
}
