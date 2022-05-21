import 'package:calender/provider/event_provider.dart';
import 'package:calender/widget/tasks_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';

import '../model/event_data_source.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return Column(children: [
      SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SfCalendar(
              view: CalendarView.month,
              dataSource: EventDataSource(events),
              initialDisplayDate: DateTime.now(),
              cellBorderColor: Colors.transparent,
              onLongPress: (details) {
                var provider =
                    Provider.of<EventProvider>(context, listen: false);
                provider.setDate(details.date!);
                showModalBottomSheet(
                    context: context, builder: (context) => TaskWidget());
              },
            )),
      )
    ]);
  }
}
