import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarWidget extends StatefulWidget {
  const TableCalendarWidget({super.key, required this.userStreaks});
  final List<DateTime> userStreaks;

  @override
  State<TableCalendarWidget> createState() => _TableCalendarWidgetState();
}

class _TableCalendarWidgetState extends State<TableCalendarWidget> {
  final DateTime _focusedDay = DateTime.now();
  static DateTime _firstDay = DateTime.now();
  static DateTime _lastDay = DateTime.now();

  @override
  void initState() {
    _firstDay = widget.userStreaks.reduce((a, b) => a.isBefore(b) ? a : b);
    _lastDay = widget.userStreaks.reduce((a, b) => a.isAfter(b) ? a : b);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(color: Colors.orange),
        weekendTextStyle: TextStyle(color: Colors.red),
        outsideTextStyle: TextStyle(color: Color.fromARGB(255, 230, 230, 230)),
      ),
      firstDay: _firstDay,
      lastDay: _lastDay,
      focusedDay: _focusedDay,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      // onPageChanged: (focusedDay) {
      //   setState(() {
      //     _focusedDay = focusedDay;
      //   });
      // },
      // onDaySelected: (selectedDay, focusedDay) {
      //   setState(() {
      //     _focusedDay = focusedDay;
      //   });
      // },
    );
  }
}
