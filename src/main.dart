import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'controllers/person_controller.dart';
import 'services/person_service.dart';
import './view/person_list_view.dart';
import './view/add_person_view.dart';
import './view/person_view.dart';
import './view/calendar_view.dart';
import 'dart:ui';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}


Future<void> main() async {

  await Hive.initFlutter();
  await Hive.openBox("storage");

  Get.lazyPut<PersonController>(() => PersonController());
  Get.lazyPut<PersonService>(() => PersonService());

  runApp(
    GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      initialRoute: '/',
      getPages: [ 
        GetPage( name: '/', page: () => PersonListView(),),
        GetPage( name: '/add', page : () => AddPersonView()),
        GetPage( name: '/person/:id', page : () => PersonView()),
        GetPage( name: '/calendar', page : () => CalendarView()),
      ],
    )
  );
}






class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home : PersonListView(),
    );
  }
}
