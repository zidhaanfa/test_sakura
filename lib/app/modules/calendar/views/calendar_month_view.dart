import 'package:flutter/material.dart';
import 'package:test_sakura/app/components/modules/calendar_data/calendar_month_data.dart';

class CalendarMonthView extends StatelessWidget {
  CalendarMonthView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Month'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 8,
        onPressed: () {},
      ),
      body: CalendarMonthData(),
    );
  }
}
