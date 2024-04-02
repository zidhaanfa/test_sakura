import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

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
      onEventTap: (event, date) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CalendarDetailView(
              event: event,
            ),
          ),
        );
      },
    );
  }
}
