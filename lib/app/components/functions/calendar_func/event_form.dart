import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sakura/app/config/base_data.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:test_sakura/app/modules/calendar/controllers/calendar_controller.dart';

import '../../../config/config.dart';
import '../../widgets/ZF_ElevatedButton.dart';
import '../../widgets/ZF_Text.dart';
import '../../widgets/ZF_button.dart';
import '../../widgets/ZF_formField.dart';
import '../../widgets/ZF_from_datetime.dart';

class EventForm extends StatefulWidget {
  EventForm({
    Key? key,
    this.onEventAdd,
    this.event,
  }) : super(key: key);
  final void Function(CalendarEventData)? onEventAdd;
  final CalendarEventData? event;

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  CalendarController c = Get.put(CalendarController());

  @override
  void initState() {
    super.initState();

    setDefaults();
  }

  @override
  void dispose() {
    c.titleNode.dispose();
    c.descriptionNode.dispose();

    c.descriptionController.dispose();
    c.titleController.dispose();

    super.dispose();
  }

  void createEvent() {
    if (!(c.form.currentState?.validate() ?? true)) return;

    c.form.currentState?.save();

    final event = CalendarEventData(
      date: c.startDate,
      endTime: c.endTime,
      startTime: c.startTime,
      endDate: c.endDate,
      color: c.colora,
      title: c.titleController.text.trim(),
      description: c.descriptionController.text.trim(),
    );

    widget.onEventAdd?.call(event);
    resetForm();
  }

  void setDefaults() {
    if (widget.event == null) return;

    final event = widget.event!;

    c.startDate = event.date;
    c.endDate = event.endDate;
    c.startTime = event.startTime ?? c.startTime;
    c.endTime = event.endTime ?? c.endTime;
    c.titleController.text = event.title;
    c.descriptionController.text = event.description ?? '';
  }

  void resetForm() {
    c.form.currentState?.reset();
    c.startDate = DateTime.now().withoutTime;
    c.endDate = DateTime.now().withoutTime;
    c.startTime = null;
    c.endTime = null;
    c.colora = Colors.blue;

    if (mounted) {
      setState(() {});
    }
  }

  void displayColorPicker() {
    var color = c.colora;
    showDialog(
      context: context,
      useSafeArea: true,
      barrierColor: Colors.black26,
      builder: (_) => SimpleDialog(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: EdgeInsets.all(20.0),
        children: [
          Text(
            "Select event color",
            style: TextStyle(
              color: ZFOtherColors.black,
              fontSize: 20.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 1.0,
            color: ZFOtherColors.grey,
          ),
          ColorPicker(
            displayThumbColor: true,
            enableAlpha: false,
            pickerColor: color,
            onColorChanged: (c) {
              color = c;
            },
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 30.0),
              child: ZFElevatedButton(
                onPressed: () {
                  if (mounted)
                    setState(() {
                      c.colora = color;
                    });
                  Get.back();
                },
                name: "Select",
                width: 130,
                height: 40,
                color: ZFButtonColors.buttonColorGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: c.form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ZFFormField(
            controller: c.titleController,
            name: "Event Title",
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: ZFFromDatetime(
                  name: "Start Date",
                  initialDateTime: c.startDate,
                  onSelect: (date) {
                    if (date.withoutTime.withoutTime
                        .isAfter(c.endDate.withoutTime)) {
                      c.endDate = date.withoutTime;
                    }

                    c.startDate = date.withoutTime;

                    if (mounted) {
                      setState(() {});
                    }
                  },
                  validator: (value) {
                    if (value == null || value == "")
                      return "Please select start date.";

                    return null;
                  },
                  textStyle: TextStyle(
                    color: ZFOtherColors.black,
                    fontSize: 15.0,
                  ),
                  onSave: (date) => c.startDate = date ?? c.startDate,
                  type: DateTimeSelectionType.date,
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: ZFFromDatetime(
                  name: "End Date",
                  initialDateTime: c.endDate,
                  onSelect: (date) {
                    if (date.withoutTime.withoutTime
                        .isBefore(c.startDate.withoutTime)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('End date occurs before start date.'),
                      ));
                    } else {
                      c.endDate = date.withoutTime;
                    }

                    if (mounted) {
                      setState(() {});
                    }
                  },
                  validator: (value) {
                    if (value == null || value == "")
                      return "Please select end date.";

                    return null;
                  },
                  textStyle: TextStyle(
                    color: ZFOtherColors.black,
                    fontSize: 15.0,
                  ),
                  onSave: (date) => c.endDate = date ?? c.endDate,
                  type: DateTimeSelectionType.date,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ZFFromDatetime(
                  name: "Start Time",
                  initialDateTime: c.startTime,
                  minimumDateTime: CalendarConstants.epochDate,
                  onSelect: (date) {
                    if (c.endTime != null &&
                        date.getTotalMinutes > c.endTime!.getTotalMinutes) {
                      c.endTime = date.add(Duration(minutes: 1));
                    }
                    c.startTime = date;
                  },
                  onSave: (date) => c.startTime = date,
                  textStyle: TextStyle(
                    color: ZFOtherColors.black,
                    fontSize: 15.0,
                  ),
                  type: DateTimeSelectionType.time,
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: ZFFromDatetime(
                  name: "End Time",
                  initialDateTime: c.endTime,
                  onSelect: (date) {
                    if (c.startTime != null &&
                        date.getTotalMinutes < c.startTime!.getTotalMinutes) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('End time is less then start time.'),
                      ));
                    } else {
                      c.endTime = date;
                    }
                  },
                  onSave: (date) => c.endTime = date,
                  textStyle: TextStyle(
                    color: ZFOtherColors.black,
                    fontSize: 15.0,
                  ),
                  type: DateTimeSelectionType.time,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ZFFormField(
            controller: c.descriptionController,
            focusNode: c.descriptionNode,
            name: "Event Description",
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              ZFText(
                text: "Event Color: ",
                maxLines: 10,
                fontType: FontType.titleMedium,
              ),
              GestureDetector(
                onTap: displayColorPicker,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: c.colora,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ZFElevatedButton(
            onPressed: createEvent,
            name: widget.event == null ? "Add Event" : "Update Event",
            width: 130,
            height: 40,
            color: ZFButtonColors.buttonColorGreen,
          ),
        ],
      ),
    );
  }
}
