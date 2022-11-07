import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:login/partials/menu/item_menu.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String ciudades = """[
          {"name":"Bogota", "temperatura": "15", "descripcion":"Epicentro de la economía, lo administrativo, la política, la industria, el arte y la cultura del país","calificacion":5,"imagen_menu":"'assets/images/lorica2.jpg'","imagen_principal":"assets/images/lorica2.jpg"},
          {"name":"Lorica", "temperatura": "28", "descripcion":"Conocida como Ciudad Antigua y Señorial, La capital del Bajo Sinú y La capital de Bocachico .","calificacion":5,"imagen_menu":"assets/images/lorica1.jpg","imagen_principal":"assets/images/lorica2.jpg"},
          {"name":"Guapi", "temperatura": "28", "descripcion":"El Pacífico colombiano con su majestuoso Parque Nacional Gorgona","calificacion":5},
          {"name":"Popayan", "temperatura": "17", "descripcion":" Popayán es uno los destinos turísticos más relevantes del sur occidente colombiano conocida como Ciudad Blanca","calificacion":4,"imagen_menu":"assets/images/lorica2.jpg","imagen_principal":"assets/images/lorica2.jpg"},
          {"name":"Cali", "temperatura": "26", "descripcion":"Sucursal del cielo,  la capital mundial de la salsa y una ciudad famosa por sus ritmos, su cultura y su gastronomía","calificacion":5,"imagen_menu":"assets/images/lorica2.jpg","imagen_principal":"assets/images/lorica2.jpg"},
          {"name":"Medellin", "temperatura": "22", "descripcion":"La ciudad mas moderna de colombia","calificacion":5,"imagen_menu":"assets/images/lorica2.jpg","imagen_principal":"assets/images/lorica2.jpg"},
          {"name":"Cartagena", "temperatura": "32", "descripcion":"La ciudad amurallada en el caribe","calificacion":5,"imagen_menu":"assets/images/lorica2.jpg","imagen_principal":"assets/images/lorica2.jpg"},
          {"name":"Pasto", "temperatura": "14", "descripcion":"conocida como la Ciudad Sorpresa de Colombia tiene dentro de su principal actividad económica el comercio y los servicios","calificacion":5,"imagen_menu":"assets/images/lorica2.jpg","imagen_principal":"assets/images/lorica2.jpg"},
          {"name":"Villavicencio", "temperatura": "28", "descripcion":"Villavicencio es una ciudad del centro de Colombia, donde los Andes se juntan con la planicie de Los Llanos","calificacion":5,"imagen_menu":"assets/images/lorica2.jpg","imagen_principal":"assets/images/lorica2.jpg"},
          {"name":"Barranquilla", "temperatura": "26", "descripcion":"Conocida como la 'Arenosa' o 'Curramba la Bella' y donde esta una de las fiestas más importante del país: el Carnaval de Barranquilla.","calificacion":5,"imagen_menu":"assets/images/lorica2.jpg","imagen_principal":"assets/images/lorica2.jpg"}
          ]""";
    List data = json.decode(ciudades);
    List<Widget> listCiudades = [];
    int contador = 0;
    for (var item in data) {
      listCiudades.add(ItemMenu(
         item['name'], item['descripcion'], item['calificacion'], contador));
      listCiudades.add(const Divider());
      contador++;
    }
    //data.forEach((key, value) => print("key: $key, value:$value"));

    return ListView(
      padding: const EdgeInsets.fromLTRB(5, 40, 5, 5),
      children: listCiudades,
    );
  }
}
