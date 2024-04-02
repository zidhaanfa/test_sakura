import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sakura/app/components/functions/calendar_func/create_event.dart';
import 'package:test_sakura/app/config/extension.dart';

import '../../../components/widgets/ZF_ElevatedButton.dart';
import '../../../components/widgets/ZF_Text.dart';
import '../../../config/base_data.dart';
import '../../../config/config.dart';
import '../bindings/calendar_binding.dart';
import '../controllers/calendar_controller.dart';

class CalendarDetailView extends GetView<CalendarController> {
  const CalendarDetailView({Key? key, required this.event}) : super(key: key);
  final CalendarEventData event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: event.color,
        elevation: 0,
        centerTitle: false,
        title: Text(
          event.title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: event.color,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ZFText(
            text:
                "Date: ${event.date.dateToStringWithFormat(format: "dd/MM/yyyy")}",
            maxLines: 1,
            fontType: FontType.titleMedium,
          ),
          SizedBox(
            height: 15.0,
          ),
          if (event.startTime != null && event.endTime != null) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("From"),
                      Text(
                        event.startTime
                                ?.getTimeInFormat(TimeStampFormat.parse_12) ??
                            "",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("To"),
                      Text(
                        event.endTime
                                ?.getTimeInFormat(TimeStampFormat.parse_12) ??
                            "",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
          if (event.description?.isNotEmpty ?? false) ...[
            Divider(),
            Text("Description"),
            SizedBox(
              height: 10.0,
            ),
            Text(event.description!),
          ],
          const SizedBox(height: 50),
          Row(
            children: [
              ZFElevatedButton(
                onPressed: () {
                  CalendarControllerProvider.of(context)
                      .controller
                      .remove(event);
                  Get.back();
                },
                color: ZFButtonColors.buttonColorRed,
                radius: 25,
                name: 'Delete Event',
                height: 45,
                width: 160,
              ),
              SizedBox(width: 30),
              ZFElevatedButton(
                onPressed: () async {
                  final result = await Get.to(
                    () => CreateEvent(
                      event: event,
                    ),
                    binding: CalendarBinding(),
                  );

                  if (result) {
                    Get.back();
                  }
                },
                color: ZFButtonColors.buttonColorGreen,
                radius: 25,
                name: 'Edit Event',
                height: 45,
                width: 160,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
