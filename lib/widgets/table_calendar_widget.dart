import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarWidget extends StatefulWidget {
  const TableCalendarWidget({super.key, required this.userStreaks});
  final List<DateTime> userStreaks;

  @override
  State<TableCalendarWidget> createState() => _TableCalendarWidgetState();
}

class _TableCalendarWidgetState extends State<TableCalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(color: Colors.orange),
        weekendTextStyle: TextStyle(color: Colors.red),
        outsideTextStyle: TextStyle(color: Color.fromARGB(255, 230, 230, 230)),
      ),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
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
          for (DateTime highlightDay in widget.userStreaks) {
            if (day.year == highlightDay.year &&
                day.month == highlightDay.month &&
                day.day == highlightDay.day) {
              return Container(
                foregroundDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 52, 52, 52)),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(38, 38, 38, 1),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color.fromARGB(255, 163, 163, 163),
                      width: 2),
                ),
                child: Center(
                    child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Colors.white),
                )),
              );
            }
          }
          return null; // Use the default builder for other days.
        },
      ),
    );
  }
}
