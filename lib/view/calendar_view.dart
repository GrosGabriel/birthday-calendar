import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/person_controller.dart';
import '../models/person.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/calendar_table_widget.dart';
import '../widgets/birthday_list_widget.dart';
import '../widgets/statistics_widget.dart';


class CalendarView extends StatelessWidget {
  final PersonController controller = Get.find<PersonController>();

  List<Person> getPersonsForDay(DateTime day) {
    return controller.persons.where((person) {
      return person.month == day.month && person.day == day.day;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: Text('Birthday Calendar')
        ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Calendrier
            Obx(() => CalendarTableWidget(
              focusedDay: controller.selectedCalendarDay.value,
              selectedDay: controller.selectedCalendarDay.value,
              onDaySelected: (selectedDay) {
                controller.selectedCalendarDay.value = selectedDay;
              },
              onPageChanged: (focusedDay) {
                controller.selectedCalendarDay.value = focusedDay;
              },
              persons: controller.persons,
            )),
            Divider(),
            // Anniversaires du jour sélectionné
            Obx(() => BirthdayListWidget(
              selectedDay: controller.selectedCalendarDay.value,
              dayPersons: getPersonsForDay(controller.selectedCalendarDay.value),
            )),
            Divider(),
            // Statistiques
            StatisticsWidget(
              controller: controller,
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}