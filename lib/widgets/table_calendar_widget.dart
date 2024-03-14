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
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 30));

  @override
  void initState() {
    _firstDay = widget.userStreaks.reduce((a, b) => a.isBefore(b) ? a : b);
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
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          for (DateTime streakDay in widget.userStreaks) {
            if (day.year == streakDay.year &&
                day.month == streakDay.month &&
                day.day == streakDay.day) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 61, 61, 61), // Highlight color
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          }
          return null; // Fallback to default styling
        },
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
