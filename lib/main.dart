import 'package:flutter/material.dart';
import './models/data_service.dart';
import './components/bottom_navbar_items.dart';
import './components/list_objects.dart';

final dataService = DataService();

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  final _buttons = [
    {"label": "Coffe", "icon": Icons.coffee_maker},
    {"label": "Drinks", "icon": Icons.local_drink},
    {"label": "Nações", "icon": Icons.flag},
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Dicas"),
            ),
            body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return ListObjects(
                  objects: value,
                  propertyNames:
                      value.isNotEmpty ? value[0].keys.toList() : null,
                  columnNames: value.isNotEmpty
                      ? value[0]
                          .keys
                          .toList()
                          .map((key) =>
                              key.replaceRange(0, 1, key[0].toUpperCase()))
                          .toList()
                      : null,
                );
              },
            ),
            bottomNavigationBar: BottomNavbarItems(
              buttons: _buttons,
              itemSelectedCallback: (index) {
                dataService.loadObjects(index);
              },
            )));
  }
}
