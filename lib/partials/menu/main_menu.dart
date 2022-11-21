import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:login/partials/menu/item_menu.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String ciudades = """[
          {"name":"Bogota", "temperatura": "15", "descripcion":"Epicentro de la economía, lo administrativo, la política, la industria, el arte y la cultura del país","calificacion":5,"imagen_menu" : "bogota1.jpg","imagen_principal" : "bogota2.jpg","lat":"4.60971","long":"-74.08175","zm":"11"},
          {"name":"Lorica", "temperatura": "28", "descripcion":"Conocida como Ciudad Antigua y Señorial, La capital del Bajo Sinú y La capital de Bocachico","calificacion":5,"imagen_menu" : "lorica1.jpg","imagen_principal" : "lorica2.jpg","lat":"9.239141","long":"-75.813648","zm":"13"},
          {"name":"Guapi", "temperatura": "28", "descripcion":"El Pacífico colombiano con su majestuoso Parque Nacional Gorgona","calificacion":5,"imagen_menu" : "guapi1.jpg","imagen_principal" : "guapi2.jpg","lat":"2.5714917","long":"-77.894271","zm":"15"},
          {"name":"Popayan", "temperatura": "17", "descripcion":" Popayán es uno los destinos turísticos más relevantes del sur occidente colombiano conocida como Ciudad Blanca","calificacion":4,"imagen_menu" : "popayan1.jpg","imagen_principal" : "pop1.jpg","lat":"2.457385","long":"-76.599934","zm":"13"},
          {"name":"Cali", "temperatura": "26", "descripcion":"Sucursal del cielo,  la capital mundial de la salsa y una ciudad famosa por sus ritmos, su cultura y su gastronomía","calificacion":5,"imagen_menu" : "cali1.jpg","imagen_principal" : "cali2.jpg","lat":"3.43722","long":"-76.5225","zm":"12"},
          {"name":"Medellin", "temperatura": "22", "descripcion":"La ciudad mas moderna de colombia","calificacion":5,"imagen_menu" : "medellin1.jpg","imagen_principal" : "medellin2.jpg","lat":"6.217","long":"-75.567","zm":"11.5"},
          {"name":"Cartagena", "temperatura": "32", "descripcion":"La ciudad amurallada en el caribe","calificacion":5,"imagen_menu" : "cartagena1.jpg","imagen_principal" : "cartagena2.jpg","lat":"10.3997200","long":"-75.5144400","zm":"13"},
          {"name":"Pasto", "temperatura": "14", "descripcion":"conocida como la Ciudad Sorpresa de Colombia tiene dentro de su principal actividad económica el comercio y los servicios","calificacion":5,"imagen_menu" : "pasto1.jpg","imagen_principal" : "pasto2.jpg","lat":"1.21361","long":"-77.28111","zm":"14"},
          {"name":"Villavicencio", "temperatura": "28", "descripcion":"Villavicencio es una ciudad del centro de Colombia, donde los Andes se juntan con la planicie de Los Llanos","calificacion":5,"imagen_menu" : "villa1.jpg","imagen_principal" : "villa2.jpg","lat":"4.142","long":"-73.62664","zm":"14"},
          {"name":"Barranquilla", "temperatura": "26", "descripcion":"Conocida como la 'Arenosa' o 'Curramba la Bella' y donde esta una de las fiestas más importante del país: el Carnaval de Barranquilla.","calificacion":5,"imagen_menu" : "barran1.jpg","imagen_principal" : "barran2.jpg","lat":"10.96854","long":"-74.78132","zm":"13"}
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

    return ListView(
      padding: const EdgeInsets.fromLTRB(5, 40, 5, 5),
      children: listCiudades,
    );
  }
}
