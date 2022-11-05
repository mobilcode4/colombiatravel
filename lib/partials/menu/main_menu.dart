import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:login/partials/menu/item_menu.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String ciudades =
        '[{"name":"Popayan", "temperatura": "17", "descripcion":"Ciudad Blanca fundada en 1537"},{"name":"Cali", "temperatura": "26", "descripcion":"Sucursal del cielo, capital de la salsa"}]';
    List data = json.decode(ciudades);
    List<Widget> listCiudades = [];
    for (var item in data) {
      listCiudades.add(ItemMenu(item['name']));
    }

    var ListaItems = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listCiudades,
    );
    //data.forEach((key, value) => print("key: $key, value:$value"));

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 40, 10, 10),
      child: ListaItems,
    );
  }
}
