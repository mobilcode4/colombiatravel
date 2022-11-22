import 'dart:convert';

import 'package:flutter/material.dart';

import '../../pages/home_page.dart';
import '../menu/item_menu.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({super.key});

  get context => null;

  @override
  Widget build(BuildContext context) {
    var ciudades = """[
          {"name":"Bogota", "temperatura": "15", "descripcion":"Epicentro de la economía, lo administrativo, la política, la industria, el arte y la cultura del país","calificacion":5,"imagen_menu" : "bogota1.jpg","imagen_principal" : "bogota2.jpg","lat":"4.60971","long":"-74.08175","zm":"11"}
          ]""";
    List data = json.decode(ciudades);
    List<Widget> listCiudades = [];
    int contador = 0;
    for (var item in data) {
      listCiudades.add(ItemMenu(
          item['name'],
          item['descripcion'],
          item['calificacion'],
          item['imagen_menu'],
          item['imagen_principal'],
          contador,
          item['lat'],
          item['long'],
          item['zm']));
      listCiudades.add(const Divider());
      contador++;
    }
    //data.forEach((key, value) => print("key: $key, value:$value"));

    var list = ListView(
      padding: const EdgeInsets.fromLTRB(5, 40, 5, 5),
      children: listCiudades,
    );

    return WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Favoritos"),
            ),
            body: list,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage(context)));
              },
              label: const Text('Todas las Ciudades'),
              backgroundColor: Colors.green,
              icon: const Icon(Icons.navigation),
            )));
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Estas seguro?'),
            content: const Text('quires salir de la App?'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: const Text('Si'),
              ),
            ],
          );
        });
    return exitApp ?? false;
  }
}
