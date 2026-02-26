

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/person_controller.dart';
import '../widgets/custom_scaffold.dart';



class PersonView extends StatelessWidget {
  final controller = Get.find<PersonController>();



  
  @override
  Widget build(BuildContext context) {
    final int? id = int.tryParse(Get.parameters['id'] ?? '');

    if (id == null) {
      return CustomScaffold(
        appBar: AppBar(
          title: Text('Invalid Person ID')
        ),
        child: Center(
          child: Text('Invalid person ID.'),
        ),
      );
    }

    final person = controller.getPersonById(id);

    if (person == null) {
      return CustomScaffold(
        appBar: AppBar(
          title: Text('Person Not Found')
        ),
        child: Center(
          child: Text('Person not found.'),
        ),
      );
    }

    return CustomScaffold(
      appBar: AppBar(
        title: Text(person.name)
      ),
      child: Column(
        children : [
          Text("This is ${person.name}'s details view."),
          Text("Birthday : ${person.day}/${person.month}/${person.year}"),
          Text("This is in ${controller.daysUntilBirthday(person.id)} days"),
          Text("Category : ${person.category}"),
        ]
      )
    );
  }
}







