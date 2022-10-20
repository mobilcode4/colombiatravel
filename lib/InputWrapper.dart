import 'package:flutter/material.dart';

import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  const InputWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: InputField(),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Olvidaste tu contraseña?",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 40,
          ),
          Button()
        ],
      ),
    );
  }
}
