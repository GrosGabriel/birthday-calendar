import 'package:get/get.dart';
import '../models/person.dart';
import '../services/person_service.dart';



class PersonController {
  final PersonService personService = Get.find();
  
  RxList<Person> persons;
  RxString selectedFilter = 'All'.obs;
  Rx<DateTime> selectedCalendarDay = DateTime.now().obs;

  PersonController() : persons = <Person>[].obs {
    persons.value = personService.persons ;
  }

  void addPerson(String name, int day, int month, int year, String category) {
    personService.addPerson(name, day, month, year, category);
    persons.value = personService.persons;
  }


  void deletePerson(int id) {
    personService.deletePerson(id);
    persons.value = personService.persons;
  }

  Person ? getPersonById(int id) {
    return persons.firstWhereOrNull((person) => person.id == id);
  }

  int daysUntilBirthday(int id) {
    final person = getPersonById(id);
    if (person == null) return -1;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    var nextBirthday = DateTime(now.year, person.month, person.day);

    if (nextBirthday.isBefore(today) || nextBirthday.isAtSameMomentAs(today)) {
      nextBirthday = DateTime(now.year + 1, person.month, person.day);
    }

    if (nextBirthday.difference(today).inDays == 365) {
      return 0;
    }
    return nextBirthday.difference(today).inDays;
  }


  List<Person> get personsSortedByUpcomingBirthday {
    final now = DateTime.now();
    final personsWithNextBirthday = persons.map((person) {
      // Calculer le prochain anniversaire
      var nextBirthday = DateTime(now.year, person.month, person.day);
      
      // Si l'anniversaire est déjà passé cette année, prendre l'année prochaine
      if (nextBirthday.isBefore(now)) {
        nextBirthday = DateTime(now.year + 1, person.month, person.day);
      }
      
      return MapEntry(person, nextBirthday);
    }).toList();

    // Trier par date d'anniversaire la plus proche
    personsWithNextBirthday.sort((a, b) => a.value.compareTo(b.value));
    
    return personsWithNextBirthday.map((entry) => entry.key).toList();




    
  }

  List<Person> get filteredAndSortedPersons {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    // Filter according to the selected filter
    List<Person> filtered;
    if (selectedFilter.value == 'All') {
      filtered = persons.toList();
    } else {
      filtered = persons.where((person) => person.category == selectedFilter.value).toList();
    }

    // Sort by upcoming birthday
    final personsWithNextBirthday = filtered.map((person) {
      var nextBirthday = DateTime(now.year, person.month, person.day);
      if (nextBirthday.isBefore(today)) {
        nextBirthday = DateTime(now.year + 1, person.month, person.day);
      }
      return MapEntry(person, nextBirthday);
    }).toList();

    personsWithNextBirthday.sort((a, b) => a.value.compareTo(b.value));
    return personsWithNextBirthday.map((entry) => entry.key).toList();
  }

}


