import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/person_controller.dart';
import '../utils/category_color_util.dart';

class StatisticsWidget extends StatelessWidget {
  final PersonController controller;

  const StatisticsWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.persons.isEmpty) {
        return Text("No statistics available.");
      }

      // Compter simplement
      final familyCount = controller.persons.where((p) => p.category == 'Family').length;
      final friendsCount = controller.persons.where((p) => p.category == 'Friends').length;
      final workCount = controller.persons.where((p) => p.category == 'Work').length;

      return Center ( child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center (child: Text('Statistics', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(height: 8),
          Center ( child :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children : [
              Container(margin: EdgeInsets.all(4), color: CategoryColorUtil.getCategoryColor('Family')['light'], child :Text('Family: $familyCount')),
              Container(margin: EdgeInsets.all(4), color: CategoryColorUtil.getCategoryColor('Friends')['light'], child :Text('Friends: $friendsCount')),
              Container(margin: EdgeInsets.all(4), color: CategoryColorUtil.getCategoryColor('Work')['light'], child :Text('Work: $workCount')),
          ])
          ),
        ],
      )
      );
    });
  }
}
