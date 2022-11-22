import 'package:flutter/material.dart';
import 'package:login/partials/menu/main_menu.dart';
import 'package:login/partials/poi/favoritos.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var context;
  HomePage(this.context, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [MainMenu(context)],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Favoritos()));
          },
          label: const Text('Favoritos'),
          backgroundColor: Colors.green,
          icon: const Icon(Icons.navigation),
        ));
  }
}
