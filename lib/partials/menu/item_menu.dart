import 'package:flutter/material.dart';
import '../poi/poi.dart';

// ignore: must_be_immutable
class ItemMenu extends StatelessWidget {
  String ciudad = '';
  String descripcion = '';
  int index = 0;
  int estrellas = 0;
  String imgCiudadMenu = '';
  String imgPrincipal = '';
  String lat = '';
  String long = '';
  String zoom = '';

  ItemMenu(this.ciudad, this.descripcion, this.estrellas, this.imgCiudadMenu,
      this.imgPrincipal, this.index, this.lat, this.long, this.zoom,
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

    var imgMenu = Image.asset('assets/images/$imgCiudadMenu',
        width: 90, height: 90, fit: BoxFit.fill);

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
      children: [imgMenu, const VerticalDivider(), columnItem],
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Poi(ciudad, descripcion, estrellas,
                    imgCiudadMenu, imgPrincipal, lat, long, zoom)));
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
