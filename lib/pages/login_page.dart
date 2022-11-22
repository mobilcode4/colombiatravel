import 'package:flutter/material.dart';
import 'package:login/models/User.dart';
import 'package:login/pages/register_page.dart';
import 'package:login/partials/poi/favoritos.dart';
import 'package:login/repository/firebase_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  UserApp userLoad = UserApp.Empty();

  final FirebaseApi _firebaseApi = FirebaseApi();

  @override
  void initState() {
    //_getUser();
    super.initState();
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

  void _validateUser() async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showMsg("Debe digitar el correo y la contrasena");
    } else {
      var userId = await _firebaseApi.logInUser(_email.text, _password.text);
      print("userID: $userId");
      String msg = "";
      if (userId == "invalid-email") {
        msg = "El correo electónico está mal escrito";
      } else if (userId == "wrong-password") {
        msg = "Correo o contrasena incorrecta";
      } else if (userId == "network-request-failed") {
        msg = "Revise su conexion a internet";
      } else if (userId == "user-not-found") {
        msg = "Usuario no registrado";
      } else {
        msg = "Bienvenido";
        _showMsg(msg);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Favoritos()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(image: AssetImage('assets/images/giphy.gif')),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      fillColor: Colors.white38,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Correo electrónico'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      fillColor: Colors.white38,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña'),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      _validateUser();
                    },
                    child: const Text('Iniciar sesión')),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.cyan)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text('Registrar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
