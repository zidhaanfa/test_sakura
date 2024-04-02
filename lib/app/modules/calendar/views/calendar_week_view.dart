import 'package:flutter/material.dart';

import '../../../components/modules/calendar_data/calendar_week_data.dart';

class CalendarWeekView extends StatelessWidget {
  CalendarWeekView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Week'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 8,
        onPressed: () {},
      ),
      body: CalendarWeekData(),
    );
  }
}
