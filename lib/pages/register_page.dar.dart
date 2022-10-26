import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/models/User.dart';
import 'package:login/pages/login_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { masculino, femenino }

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  Genre? _genre = Genre.masculino;

  bool _aventura = false;
  bool _fantasia = false;
  bool _terror = false;

  String buttonMsg = "Fecha de nacimiento ";

  String _date = "";

  String _dateConverter(DateTime newDate){
    final DateFormat formatter = DateFormat("yyyy-mm-dd");
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showSelectDate() async {
    final DateTime? newDate = await showDatePicker(
        context: context,
        locale: const Locale("es", "CO"),
        initialDate: DateTime(2022,8),
        firstDate: DateTime(1900,1),
        lastDate: DateTime(2022,12),
        helpText: "Fecha de nacimiento"
    );
    if (newDate != null){
      setState(() {
        _date = _dateConverter(newDate);
        buttonMsg = "Fecha de nacimiento: ${_date.toString()}";
      });
    }
  }

  void _showMsg (String msg){
    final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          SnackBar(content: Text(msg),
          action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
          ),
        );
  }

  void saveUser(User user)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  void _onRegisterButtonClicked() {
    setState(() {
      // comparar contrasts
      if(_password.text == _repPassword.text){
        String genre = "Masculono";
        String favoritos = "";
        if (_genre == Genre.femenino) {
          genre = "Femenino";
        }

        if (_aventura) favoritos = "$favoritos Aventura de";
        if (_fantasia) favoritos = "$favoritos Fantasia";
        if (_terror) favoritos = "$favoritos Terror";

        var user = User(_name.text, _email.text, _password.text, _genre, favoritos, _date);
        saveUser(user);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));

        /*_data =
          "nombre: ${_name.text} \nCorreo electronico ${_email.text} "
              "\n Genero:${_genre} \n Generos favoristos: $favoritos "
              "\n Fecha de nacimiento: $_date";*/
      }else{
        _showMsg ("Las contraseñas deben ser iguales");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("",),
                const Text("REGISTER", style: TextStyle(fontSize: 30,),
                ),
                const Image(image: AssetImage('assets/images/logo.png')),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nombre'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo electronico'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'contraseña'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _repPassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Repetir Contraseña'),
                  keyboardType: TextInputType.text,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text("Masculino"),
                        leading: Radio<Genre>(
                          value: Genre.masculino,
                          groupValue: _genre,
                          onChanged: (Genre? value) {
                            setState(() {
                              _genre = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text("Femenino"),
                        leading: Radio<Genre>(
                          value: Genre.femenino,
                          groupValue: _genre,
                          onChanged: (Genre? value) {
                            setState(() {
                              _genre = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Generos favoritos",
                  style: TextStyle(fontSize: 20),
                ),
                CheckboxListTile(
                  title: const Text("Aventura"),
                  value: _aventura,
                  selected: _aventura,
                  onChanged: (bool? value) {
                    setState(() {
                      _aventura = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Fantasia"),
                  value: _fantasia,
                  selected: _fantasia,
                  onChanged: (bool? value) {
                    setState(() {
                      _fantasia = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Terror"),
                  value: _terror,
                  selected: _terror,
                  onChanged: (bool? value) {
                    setState(() {
                      _terror = value!;
                    });
                  },
                ),

                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    _showSelectDate();
                  },
                  child: Text(buttonMsg),
                ),

                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    _onRegisterButtonClicked();
                  },
                  child: const Text("Registrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
