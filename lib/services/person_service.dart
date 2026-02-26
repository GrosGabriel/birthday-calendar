import 'package:hive_ce_flutter/hive_flutter.dart';
import '../models/person.dart';


class PersonService {
  final storage = Hive.box("storage");

  List<Person> get persons {
    final data = storage.get('persons');

    // Toujours retourner une liste
    if (data == null || data is! List) {
      return [];
    }

    return data.map<Person>((json) => Person.fromJson(json)).toList();
  }



  void saveAll(List<Person> list) {
    storage.put('persons', list.map((p) => p.toJson()).toList());
  }

  void addPerson(String name, int day, int month, int year, String category) {
    final newId = persons.length + 1;
    final newPerson = Person(
      id: newId,
      name: name,
      day: day,
      month: month,
      year: year,
      category: category,
    );
    final updatedPersons = [...persons, newPerson];
    saveAll(updatedPersons);
  }

  void deletePerson(int id) {
    final updatedPersons = persons.where((p) => p.id != id).toList();
    saveAll(updatedPersons);
  }


}
