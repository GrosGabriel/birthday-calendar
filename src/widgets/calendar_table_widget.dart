import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/person.dart';
import '../utils/category_color_util.dart';

class CalendarTableWidget extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime selectedDay;
  final Function(DateTime) onDaySelected;
  final Function(DateTime) onPageChanged;
  final List<Person> persons;

  const CalendarTableWidget({
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
    required this.onPageChanged,
    required this.persons,
  });

List<Person> _getPersonsForDay(DateTime day) =>
    persons.where((p) => p.month == day.month && p.day == day.day).toList();


  Widget _buildMarker(List<Person> dayPersons) {
    if (dayPersons.isEmpty) return SizedBox();

    final categories = <String>{};
    for (var p in dayPersons) {
      categories.add(p.category);
    }

    final categoryList = categories.toList();
    final positions = [
      {'left': 17, 'top': 17},
      {'left': 25, 'top': 17},
      {'left': 21, 'top': 25},
    ];

    return Stack(
      children: List.generate(categoryList.length, (index) {
        final pos = positions[index % positions.length];
        return Positioned(
          left: (pos['left'] as int).toDouble(),
          top: (pos['top'] as int).toDouble(),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CategoryColorUtil.getCategoryColor(categoryList[index])['color'],
              border: Border.all(color: Colors.white, width: 1),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: TableCalendar(
        focusedDay: focusedDay,
        firstDay: DateTime(2000),
        lastDay: DateTime(2100),
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          onDaySelected(selectedDay);
        },
        onPageChanged: (focusedDay) {
          onPageChanged(focusedDay);
        },
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: const {CalendarFormat.month: ''},
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, day, events) {
            return _buildMarker(_getPersonsForDay(day));
          },
        ),
      ),
    );
  }
}
