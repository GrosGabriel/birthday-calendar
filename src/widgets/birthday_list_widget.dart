import 'package:flutter/material.dart';
import '../models/person.dart';
import '../utils/category_color_util.dart';

class BirthdayListWidget extends StatelessWidget {
  final DateTime selectedDay;
  final List<Person> dayPersons;

  const BirthdayListWidget({
    required this.selectedDay,
    required this.dayPersons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Birthdays on ${selectedDay.day}/${selectedDay.month}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 12),
          if (dayPersons.isEmpty)
            Text('No birthdays on this day')
          else
            Column(
              children: dayPersons.map((person) {
                final colors = CategoryColorUtil.getCategoryColor(person.category);
                return Card(
                  color: colors['light'],
                  child: ListTile(
                    title: Text(person.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Born: ${person.year}'),
                        Text(person.category),
                      ],
                    ),
                    leading: Container(
                      width: 4,
                      color: colors['color'],
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
