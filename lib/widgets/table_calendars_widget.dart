import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/widgets/table_calenda_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarsWidget extends StatefulWidget {
  const TableCalendarsWidget({super.key, required this.userStreaks});
  final List<DateTime> userStreaks;

  @override
  State<TableCalendarsWidget> createState() => _TableCalendarsWidgetState();
}

class _TableCalendarsWidgetState extends State<TableCalendarsWidget> {
  final DateTime _focusedDay = DateTime.now();
  static DateTime _firstDay = DateTime.now();
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 30));

  final List<String> monthsList = [];
  final Map<String, List<DateTime>> userCalendarParsedData =
      <String, List<DateTime>>{};

  @override
  void initState() {
    _firstDay = widget.userStreaks.reduce((a, b) => a.isBefore(b) ? a : b);

    for (int i = 0; i < widget.userStreaks.length; i++) {
      var month = widget.userStreaks[i].month;
      monthsList.add(month.toString());

      userCalendarParsedData[month.toString()] = [];
    }

    // seperate userStreaks list into an object conaining different months - each having a different _firstDay and _lastDay
    for (int i = 0; i < widget.userStreaks.length; i++) {
      var userDateTimeData = widget.userStreaks[i];
      userCalendarParsedData[userDateTimeData.month.toString()]!
          .add(userDateTimeData);
    }
    super.initState();
    // {1: [2024-01-17 13:51:10.794689], 2: [2024-02-16 13:51:10.794710], 3: [2024-03-02 13:51:10.794713, 2024-03-09 13:51:10.794716, 2024-03-10 13:51:10.794718, 2024-03-11 13:51:10.794721, 2024-03-12 13:51:10.794723, 2024-03-13 13:51:10.794725]}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...userCalendarParsedData.isNotEmpty
            ? userCalendarParsedData.keys
                .map((k) => TableCalendarWidget(
                      firstDay: DateTime.now(),
                      lastDay: DateTime.now(),
                      focusedDay: DateTime.now(),
                      userStreaks: widget.userStreaks,
                    ))
                .toList()
            : [const SizedBox(height: 3)],
      ],
    );
  }
}
