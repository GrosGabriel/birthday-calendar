import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/person.dart';
import '../controllers/person_controller.dart';

class PersonListWidget extends StatelessWidget {
  final List<Person> persons;
  final PersonController controller;

  const PersonListWidget({super.key, required this.persons, required this.controller});


  Map<String, Color> getCategoryColor(String category) {
  switch (category) {
    case 'Family':
      return {'color': Colors.blue, 'light': Colors.blue.shade100};
    case 'Friends':
      return {'color': Colors.green, 'light': Colors.green.shade100};
    case 'Work':
      return {'color': Colors.orange, 'light': Colors.orange.shade100};
    default:
      return {'color': Colors.grey, 'light': Colors.grey.shade100};
  }
}

  @override
  Widget build(BuildContext context) {
    if (persons.isEmpty) {
      return Center(child: Text('No persons'));
    }

    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) {
        final person = persons[index];
        return ListTile(
          title: Text(person.name),
          subtitle: Text('${person.day}/${person.month}/${person.year} • ${person.category}'),
          tileColor: getCategoryColor(person.category)['light'],
          trailing: IconButton(
            icon: Icon(Icons.delete, color: const Color.fromARGB(255, 82, 81, 81)),
            onPressed: () {
              controller.deletePerson(person.id);
            },
          ),
          onTap: () {
            Get.toNamed('/person/${person.id}');
          },
        );
      },
    );
  }
}
