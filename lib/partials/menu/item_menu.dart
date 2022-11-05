import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  String name = '';

  ItemMenu(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Text(name),
    );
  }
}
