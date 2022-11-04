import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/models/User.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/repository/firebase_api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { masculino, femenino }

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseApi _firebaseApi = FirebaseApi();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  String _data = "Informacion: ";

  Genre? _genre = Genre.masculino;
  bool _Bogota = false;
  bool _Lorica = false;
  bool _Popayan = false;
  bool _Guapi = false;
  bool _Cali = false;

  String buttonMsg = "Fecha de nacimiento";

  String _date = "";

  String _dateConverter(DateTime newDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showSelectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime(2022, 8),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2022, 12),
      helpText: "Fecha de nacimiento",
    );
    if (newDate != null) {
      setState(() {
        _date = _dateConverter(newDate);
        buttonMsg = "Fecha de nacimiento: ${_date.toString()}";
      });
    }
  }

  void _showMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void saveUser(User user) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setString("user", jsonEncode(user));
    var result = await _firebaseApi.registerUser(user.email, user.password);
  }

  void _onRegisterButtonClicked() {
    setState(() {
      if (_password.text == _repPassword.text) {
        String genre = "Masculino";
        String favoritos = "";

        if (_genre == Genre.femenino) {
          genre = "Femenino";
        }
        if (_Bogota) favoritos = "Bogota,";
        if (_Lorica) favoritos = "$favoritos Lorica,";
        if (_Popayan) favoritos = "$favoritos Popayan,";
        if (_Guapi) favoritos = "$favoritos Guapi,";
        if (_Cali) favoritos = "$favoritos Cali,";
        var user = User(
            _name.text, _email.text, _password.text, genre, favoritos, _date);
        saveUser(user);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        _showMsg("Las contraseñas deben de ser iguales");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "",
                ),
                const Text(
                  "Ingresa tus datos",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Image(image: AssetImage('assets/images/images (1).png')),
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
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Contraseña'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _repPassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Repetir Contraseña"),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Masculino'),
                        leading: Radio<Genre>(
                            value: Genre.masculino,
                            groupValue: _genre,
                            onChanged: (Genre? value) {
                              setState(() {
                                _genre = value;
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Femenino'),
                        leading: Radio<Genre>(
                            value: Genre.femenino,
                            groupValue: _genre,
                            onChanged: (Genre? value) {
                              setState(() {
                                _genre = value;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Ciudades de Interes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CheckboxListTile(
                  title: const Text('Bogota'),
                  value: _Bogota,
                  selected: _Bogota,
                  onChanged: (bool? value) {
                    setState(() {
                      _Bogota = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Lorica'),
                  value: _Lorica,
                  selected: _Lorica,
                  onChanged: (bool? value) {
                    setState(() {
                      _Lorica = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Popayan'),
                  value: _Popayan,
                  selected: _Popayan,
                  onChanged: (bool? value) {
                    setState(() {
                      _Popayan = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Guapi'),
                  value: _Guapi,
                  selected: _Guapi,
                  onChanged: (bool? value) {
                    setState(() {
                      _Guapi = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Cali'),
                  value: _Cali,
                  selected: _Cali,
                  onChanged: (bool? value) {
                    setState(() {
                      _Cali = value!;
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
                const SizedBox(
                  height: 16,
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
