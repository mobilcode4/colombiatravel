import 'package:flutter/material.dart';
import 'package:login/partials/poi/tarjeta.dart';
import 'descripcion_fondo.dart';

// ignore: must_be_immutable
class Cabecera extends StatelessWidget {
  String imgPrincipal = '';
  Cabecera(this.imgPrincipal, {super.key});

  @override
  Widget build(BuildContext context) {
    final cabecera = Stack(
      children: [DescripcionFondo(), Tarjeta("assets/images/$imgPrincipal")],
    );

    return cabecera;
  }
}
