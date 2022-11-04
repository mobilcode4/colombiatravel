import 'package:flutter/material.dart';
import 'package:login/partials/lista_comentarios.dart';

class Description extends StatelessWidget {
  String nombreCiudad;
  int starts;
  String msg;

  Description(this.nombreCiudad, this.starts, this.msg);

  @override
  Widget build(BuildContext context) {
    final description = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Text(
        msg,
        style: const TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );

    final estrellaVacia = Container(
      margin: const EdgeInsets.only(top: 300.0, right: 3.0),
      child: const Icon(Icons.star_border, color: Colors.yellow),
    );

    final estrellaMedia = Container(
      margin: const EdgeInsets.only(top: 300.0, right: 3.0),
      child: const Icon(Icons.star_half, color: Colors.yellow),
    );

    final estrella = Container(
      margin: const EdgeInsets.only(top: 300.0, right: 3.0),
      child: const Icon(Icons.star, color: Colors.yellow),
    );

    final titulo_descripcion = Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            top: 300.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            nombreCiudad,
            style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: [estrella, estrella, estrella, estrella, estrella],
        )
      ],
    );

    return Column(
      children: [titulo_descripcion, description, const ListaComentarios()],
    );
  }
}
