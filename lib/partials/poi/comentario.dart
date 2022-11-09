import 'package:flutter/material.dart';

class Comentario extends StatelessWidget {
  String pathImgUser = "assets/img/traveler.jpg";
  String userName = "Traveler One";
  String detalles = "2 Comentarios 10 Fotos";
  String comentario = "Popayan es como un viaje en el tiempo";
  Comentario(this.pathImgUser, this.userName, this.detalles, this.comentario,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final comentarioUsuario = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        comentario,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w900),
      ),
    );

    final infoUsuario = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        detalles,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
    );

    final nombreUsuario = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        userName,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 17.0,
        ),
      ),
    );

    //Contenedor del comentario del usuario
    final contenedorComentario = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [nombreUsuario, infoUsuario, comentarioUsuario],
    );

    //Imagen del Usuario
    final imageUser = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(pathImgUser))),
    );
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [imageUser, contenedorComentario]),
        );
  }
}
