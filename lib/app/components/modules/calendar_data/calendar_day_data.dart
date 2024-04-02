import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/base_data.dart';
import '../../../modules/calendar/bindings/calendar_binding.dart';
import '../../../modules/calendar/views/calendar_detail_view.dart';

class CalendarDayData extends StatelessWidget {
  final GlobalKey<DayViewState>? stateDay;
  final double? width;
  const CalendarDayData({
    Key? key,
    this.stateDay,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DayView(
      key: stateDay,
      width: width,
      headerStyle: HeaderStyle(
          decoration: BoxDecoration(
        color: ZFOtherColors.green.withOpacity(0.4),
      )),
      startDuration: Duration(hours: 8),
      showHalfHours: true,
      heightPerMinute: 3,
      timeLineBuilder: _timeLineBuilder,
      hourIndicatorSettings: HourIndicatorSettings(
        color: Theme.of(context).dividerColor,
      ),
      halfHourIndicatorSettings: HourIndicatorSettings(
        color: Theme.of(context).dividerColor,
        lineStyle: LineStyle.dashed,
      ),
      verticalLineOffset: 0,
      timeLineWidth: 65,
      showLiveTimeLineInAllDays: true,
      liveTimeIndicatorSettings: LiveTimeIndicatorSettings(
        color: Colors.redAccent,
        showBullet: false,
        showTime: true,
        showTimeBackgroundView: true,
      ),
      onEventTap: (event, date) {
        Get.to(
          () => CalendarDetailView(
            event: event.first,
          ),
          binding: CalendarBinding(),
        );
      },
    );
  }

  Widget _timeLineBuilder(DateTime date) {
    if (date.minute != 0) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: -8,
            right: 8,
            child: Text(
              "${date.hour}:${date.minute}",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black.withAlpha(50),
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            ),
          ),
        ],
      );
    }

    final hour = ((date.hour - 1) % 12) + 1;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          top: -8,
          right: 8,
          child: Text(
            "$hour ${date.hour ~/ 12 == 0 ? "am" : "pm"}",
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
