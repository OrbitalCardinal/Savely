import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'accountLogIn.dart';
import 'errorModal.dart';
import 'loginBackground.dart';
import 'textLogo.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = 'signup-screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confpassController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[800],
      body: Container(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
          child: Theme(
            data: ThemeData(
              accentColor: Colors.cyan[300],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextLogo(),
                TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan[300]),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      filled: true,
                      fillColor: Colors.grey[600],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      prefixIcon: Icon(Icons.person),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                TextField(
                  controller: _passController,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan[300]),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      filled: true,
                      fillColor: Colors.grey[600],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      prefixIcon: Icon(Icons.vpn_key),
                      labelText: "Contraseña",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                TextField(
                  controller: _confpassController,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan[300]),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      filled: true,
                      fillColor: Colors.grey[600],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      prefixIcon: Icon(Icons.vpn_key),
                      labelText: "Confirmar contraseña",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                Container(
                  height: size.height / 13,
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      "Registrate",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                    color: Colors.blue[500],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () async {
                      try {
                        if (_confpassController.text == _passController.text) {
                          await _auth
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passController.text)
                              .then((user) {
                            try {
                              _auth.currentUser.sendEmailVerification();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ErrorModal(
                                        'Se ha enviado el correo de verificación');
                                  }).then((value) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (_) {
                                  return LoginBackground();
                                }));
                              });
                            } catch (e) {
                              print(e);
                            }
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  ErrorModal('Las constraseñas no coinciden'));
                        }
                      } catch (err) {
                        if (err.code == 'weak-password') {
                          showDialog(
                              context: context,
                              builder: (context) => ErrorModal(
                                  'La contraseña debe contener más de 6 caracteres.'));
                        }
                      }
                    },
                  ),
                ),
                AccountLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
