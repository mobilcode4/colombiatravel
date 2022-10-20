import 'package:flutter/material.dart';

class InputField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey)
            )
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Ingresa tu email",
              hintStyle: TextStyle(color: Colors.grey[500]),
              border: InputBorder.none
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Ingresa tu contraseña",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }
}