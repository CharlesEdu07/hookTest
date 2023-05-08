import 'package:flutter/material.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);

  void loadFunctions(int index) {
    List<Function> functions = [
      loadCoffees,
      loadDrinks,
      loadNations,
    ];

    functions[index]();
  }

  void loadObjects(int index) {
    loadFunctions(index);
  }

  void loadDrinks() {
    tableStateNotifier.value = [
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"}
    ];
  }

  void loadNations() {
    tableStateNotifier.value = [
      {
        "name": "Brasil",
        "continent": "America do Sul",
        "language": "Português"
      },
      {
        "name": "Colômbia",
        "continent": "America do Sul",
        "language": "Espanhol"
      },
      {"name": "Etiópia", "continent": "Africa", "language": "Amárico"},
      {"name": "Japão", "continent": "Asia", "language": "Japonês"}
    ];
  }

  void loadCoffees() {
    tableStateNotifier.value = [
      {"name": "Café do Brasil", "type": "Robusto", "flavor": "Chocolate"},
      {"name": "Café da Colômbia", "type": "Forte", "flavor": "Caramelo"},
      {"name": "Café da Etiópia", "type": "Arabica", "flavor": "Canela"}
    ];
  }
}
