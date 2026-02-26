import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/person_controller.dart';
import '../widgets/person_list_widget.dart';
import '../widgets/custom_scaffold.dart';
import '../utils/breakpoints.dart';




class PersonListView extends StatelessWidget {
  final PersonController controller = Get.find<PersonController>();




  dynamic _drawerButtons() { 
    return [
        IconButton(
          onPressed: () {
            Get.toNamed('/calendar');
          },
          icon: Icon(Icons.calendar_today, size: 28),
          tooltip: 'Calendar',
        ),
        const SizedBox(height: 12),
        Padding(padding: EdgeInsets.symmetric(vertical: 8), child:
        Obx(() => SegmentedButton<String>(
            segments: [
              ButtonSegment(value: 'All', label: Text('All',style:TextStyle(fontSize:11))),
              ButtonSegment(value: 'Family', label: Text('Family',style:TextStyle(fontSize:11))),
              ButtonSegment(value: 'Friends', label: Text('Friends',style:TextStyle(fontSize:11))),
              ButtonSegment(value: 'Work', label: Text('Work',style:TextStyle(fontSize:11))),
            ],
            selected: {controller.selectedFilter.value},
            onSelectionChanged: (Set<String> newSelection) {
              controller.selectedFilter.value = newSelection.first;
            },
             showSelectedIcon: false,
          ),
        )
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () {
            Get.toNamed('/add');
          },
          icon: Icon(Icons.add),
          label: Text('Add'),
        ),
      ];
    }

  dynamic _upNavBar() { 
  //same as _drawerButtons but horizontal
  return [
      IconButton(
        onPressed: () {
          Get.toNamed('/calendar');
        },
        icon: Icon(Icons.calendar_today, size: 28),
        tooltip: 'Calendar',
      ),
      const SizedBox(width: 12),
      Padding(padding: EdgeInsets.symmetric(vertical: 8), child:
      Obx(() =>SegmentedButton<String>(
          segments: [
            ButtonSegment(value: 'All', label: Text('All',style:TextStyle(fontSize:11))),
            ButtonSegment(value: 'Family', label: Text('Family',style:TextStyle(fontSize:11))),
            ButtonSegment(value: 'Friends', label: Text('Friends',style:TextStyle(fontSize:11))),
            ButtonSegment(value: 'Work', label: Text('Work',style:TextStyle(fontSize:11))),
          ],
          selected: {controller.selectedFilter.value},
          onSelectionChanged: (Set<String> newSelection) {
            controller.selectedFilter.value = newSelection.first;
          },
            showSelectedIcon: false,
        ),
      )
      ),
      const SizedBox(width: 12),
      ElevatedButton.icon(
        onPressed: () {
          Get.toNamed('/add');
        },
        icon: Icon(Icons.add),
        label: Text('Add'),
      ),
    ];
  }

  dynamic _bottomNavBar() {
    return Container(color: Colors.white,child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _upNavBar(),
      )

    );
  }


  dynamic _drawerNavBar() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 84, 86, 87),
            ),
            child: Text(
              'Home Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ..._drawerButtons()
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final isSm = constraints.maxWidth < Breakpoints.sm;
      final isMd = constraints.maxWidth >= Breakpoints.sm && constraints.maxWidth < Breakpoints.md;
      return CustomScaffold(
        appBar: AppBar(title:Text("Who's celebrating soon ?"),
            actions: !isSm && !isMd ? _upNavBar() : null,
            ),
        bottomNavigationBar: isSm ? _bottomNavBar() : null,
        drawer : isMd ? _drawerNavBar() : null,
        child : Obx(() => PersonListWidget(
              persons: controller.filteredAndSortedPersons,
              controller: controller,
            )),
      );



    }
    );
  }
}