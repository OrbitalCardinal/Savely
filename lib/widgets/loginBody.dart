import 'package:flutter/material.dart';
import 'DividerAuth.dart';
import 'expandedBlueButton.dart';
import '../facebookCircularButton.dart';
import '../googleCircularButton.dart';
import 'noAccountRegister.dart';
import 'textFieldGrey.dart';
import 'textLogo.dart';

class LoginBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width - size.width / 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextLogo(),
                SizedBox(height: size.height / 25),
                TextFieldGrey(
                  labelText: "Email",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.cyan[300],
                  ),
                  pass: false,
                ),
                SizedBox(height: size.height / 40),
                TextFieldGrey(
                  labelText: "Contraseña",
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.cyan[300],
                  ),
                  pass: true,
                ),
                SizedBox(height: size.height / 25),
                ExpandedBlueButton(login: true,),
                SizedBox(height: size.height / 45),
                GestureDetector(
                  child: Text(
                    "¿Olvidate tu contraseña?",
                    style: TextStyle(fontSize: 18, color: Colors.cyan[300]),
                  ),
                  onTap: () {
                    print("Olvidaste tu contrasena");
                  },
                ),
                SizedBox(height: size.height / 20),
              ],
            ),
          ),
          Container(
            width: size.width - size.width / 10,
            child: Column(
              children: [
                DividerAuth("  O también inicia sesión con:  "),
                SizedBox(height: size.height / 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleCircularButton(),
                    FacebookCircularButton(),
                  ],
                ),
                SizedBox(height: size.height / 50),
                NoAccountRegister(),
              ],
            ),
          )
        ],
      ),
    );
  }
}





