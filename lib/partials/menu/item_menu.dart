import 'package:flutter/material.dart';
import '../poi/poi.dart';

// ignore: must_be_immutable
class ItemMenu extends StatelessWidget {
  String ciudad = '';
  String descripcion = '';
  int index = 0;
  int estrellas = 0;


  ItemMenu(this.ciudad, this.descripcion, this.estrellas,  this.index,
      {super.key});

  @override
  Widget build(BuildContext context) {
    //Color de la Fila
    //var colorFondo = const Color.fromARGB(115, 85, 192, 241);
    var colorFondo = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.blue,
        Colors.white,
      ],
    );
    if (index.isEven) {
      colorFondo = const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.grey,
          Colors.white,
        ],
      );
    }

    final columnItem = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ciudad,
            style:
                const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w900)),
        Container(
          width: 270,
          child: Text(descripcion),
        )
      ],
    );
    final contenedorFila = Row(
      children: [
        const Image(image: AssetImage('assets/images/lorica2.jpg'))]
    );

    return GestureDetector(
      onTap: () {
        print(ciudad);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Poi(ciudad, descripcion, estrellas)));
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: colorFondo,
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: contenedorFila,
      ),
    );
  }
}
