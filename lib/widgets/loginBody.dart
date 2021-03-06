import 'package:Savely/widgets/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'errorModal.dart';
import 'noAccountRegister.dart';
import 'textLogo.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final emailController = TextEditingController();
  final emailSaveController = TextEditingController();
  final passController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width - size.width / 6,
            child: Theme(
              data: ThemeData(accentColor: Colors.cyan[300]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextLogo(),
                  SizedBox(height: size.height / 25),
                  TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan[300]),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        filled: true,
                        fillColor: Colors.grey[600],
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        prefixIcon: Icon(Icons.person),
                        labelText: "Email",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  SizedBox(height: size.height / 40),
                  TextField(
                    controller: passController,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: "Contraseña",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  SizedBox(height: size.height / 25),
                  Container(
                    height: size.height / 13,
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text(
                        "Iniciar sesión",
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                      color: Colors.blue[500],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onPressed: () async {
                        try {
                          await _auth
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passController.text)
                              .then((user) {
                            if (user.user.emailVerified) {
                              Navigator.of(context)
                                  .pushReplacementNamed(HomePage.routeName);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => ErrorModal(
                                      'El correo no ha sido verificado'));
                            }
                          });
                        } catch (err) {
                          print(err.code);
                          if (err.code == 'wrong-password') {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    ErrorModal('La contraseña es incorrecta'));
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: size.height / 45),
                  GestureDetector(
                    child: Text(
                      "¿Olvidaste tu contraseña?",
                      style: TextStyle(fontSize: 18, color: Colors.cyan[300]),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Recuperación de contraseña',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextField(
                                        controller: emailSaveController,
                                        decoration:
                                            InputDecoration(labelText: 'Email'),
                                      ),
                                    ]),
                              ),
                              actions: [
                                FlatButton(child: Text('Cancelar'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },),
                                FlatButton(
                                  child: Text('Enviar'),
                                  onPressed: () {
                                    _auth.sendPasswordResetEmail(
                                            email: emailSaveController.text)
                                        .then((_) {
                                          showDialog(context: context, builder: (context) {
                                            ErrorModal('Se ha enviado un correo para el cambio de contraseña');
                                          });
                                        });
                                  },
                                ),
                              ],
                            );
                          });
                      // _auth.sendPasswordResetEmail(email: null)
                    },
                  ),
                  SizedBox(height: size.height / 20),
                ],
              ),
            ),
          ),
          Container(
            width: size.width - size.width / 10,
            child: Column(
              children: [
                NoAccountRegister(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
