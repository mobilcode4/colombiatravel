import 'package:flutter/material.dart';
import '../partials/descripcion.dart';
import '../partials/tarjeta.dart';
import '../partials/cabecera.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String msg =
      "Departamento: Cauca \nTemperatura: 18 Grados\n\nEs una ciudad del oeste de Colombia, al suroeste de Bogotá. Es conocida por sus edificios coloniales encalados y por ser un centro religioso con procesiones populares en Semana Santa. Las iglesias principales de la ciudad incluyen la Catedral Basílica de Nuestra Señora de la Asunción, de estilo neoclásico y con una cúpula, y la Iglesia de La Ermita, del siglo XVII.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          children: [Description("Popayan", 5, msg)],
        ),
        Cabecera()
      ],
    ));
  }
}
