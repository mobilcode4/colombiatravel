import 'package:flutter/material.dart';
import 'package:login/partials/tarjeta.dart';
import '../partials/descripcion_fondo.dart';
import '../partials/tarjeta.dart';

class Cabecera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cabecera = Stack(
      children: [DescripcionFondo(), Tarjeta("assets/images/pop1.jpg")],
    );

    return cabecera;
  }
}
