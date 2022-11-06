import 'package:flutter/material.dart';
import 'package:login/partials/poi/tarjeta.dart';
import 'descripcion_fondo.dart';

class Cabecera extends StatelessWidget {
  const Cabecera({super.key});

  @override
  Widget build(BuildContext context) {
    final cabecera = Stack(
      children: [DescripcionFondo(), Tarjeta("assets/images/pop1.jpg")],
    );

    return cabecera;
  }
}
