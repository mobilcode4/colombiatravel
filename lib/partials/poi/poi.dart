import 'package:flutter/material.dart';
import 'descripcion.dart';
import 'cabecera.dart';
import 'map.dart';

// ignore: must_be_immutable
class Poi extends StatelessWidget {
  String msg;
  String ciudad;
  int estrellas;
  String imgCiudadMenu;
  String imgPrincipal;
  Poi(this.ciudad, this.msg, this.estrellas, this.imgCiudadMenu,
      this.imgPrincipal,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [Description(ciudad, estrellas, msg)],
          ),
          Cabecera(imgPrincipal)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Map()));
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.map),
      ),
    );
  }
}
