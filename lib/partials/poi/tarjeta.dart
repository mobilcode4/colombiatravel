import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tarjeta extends StatelessWidget {
  String rutaImagen = "assets/images/pop1.jpg";

  Tarjeta(this.rutaImagen, {super.key});

  @override
  Widget build(BuildContext context) {
    print(rutaImagen);
    final tarjeta = Container(
      height: 270.0,
      width: 290.0,
      margin: const EdgeInsets.only(top: 30.0, left: 20.0),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(rutaImagen)),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
                color: Colors.black, blurRadius: 15.0, offset: Offset(0.0, 7.0))
          ]),
    );

    return tarjeta;
  }
}
