import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = 'profile-screen';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
        ),
        RaisedButton(
          child: Text('Cerrar sesión'),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        )
      ],
    );
  }
}