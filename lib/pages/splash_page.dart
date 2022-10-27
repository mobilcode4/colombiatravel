import 'package:flutter/material.dart';
import 'package:login/pages/login_page.dart';

class Splash_page extends StatefulWidget {
  const Splash_page({Key? key}) : super(key: key);

  @override
  State<Splash_page> createState() => _Splash_pageState();
}

class _Splash_pageState extends State<Splash_page> {

  void initState(){
    _closeSplash();
    super.initState();
  }

  Future<void> _closeSplash() async {

    Future.delayed(const Duration(seconds: 4), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/images/splash.jpg'),),
      ),
    );
  }
}
