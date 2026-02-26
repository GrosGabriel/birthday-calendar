


class Person {
  int id;
  String name ;
  int day;
  int month;
  int year;
  String category;

  Person( {
    required this.id,
    required this.name,
    required this.day,
    required this.month,
    required this.year,
    required this.category,
  });


  Map toJson () => {
        'id': id,
        'name': name,
        'day': day,
        'month': month,
        'year': year,
        'category': category,
      };
  
  factory Person.fromJson(Map json) {
    return Person(
      id: json['id'],
      name: json['name'],
      day: json['day'],
      month: json['month'],
      year: json['year'],
      category: json['category'],
    );  
  }

}