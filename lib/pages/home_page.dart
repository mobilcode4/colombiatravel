import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: const <Widget>[
              Text(
                "",
              ),
              Text(
                "META COMPLIDA PARA EL SPRINT 2",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Image(image: AssetImage('assets/images/logo.png')),
              SizedBox(),
            ],
          )),
        ),
      ),
    );
  }
}
