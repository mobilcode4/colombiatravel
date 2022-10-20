import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.cyan[500],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: () {
            print('hola');
          },
          child: const Text('Disfruta de tu viaje'),
        ),
      ),
    );
  }
}
