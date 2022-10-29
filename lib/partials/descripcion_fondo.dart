import 'package:flutter/material.dart';

class DescripcionFondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blueGrey, Colors.white]),
      ),
    );
  }
}
