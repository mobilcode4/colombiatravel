import 'package:flutter/material.dart';
import 'comentario.dart';

class ListaComentarios extends StatelessWidget {
  const ListaComentarios({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Comentario(
            "assets/img/traveler.jpg",
            "traveler Uno",
            "3 Comentarios 9 Fotos",
            "Popayan es como un viaje en el tiempo, muy hermoso!!!"),
        Comentario(
            "assets/img/traveler2.jpg",
            "traveler Dos",
            "1 Comentarios 2 Fotos",
            "Es peque pero todo es muy bonito, hay que volver.")
      ],
    );
  }
}
