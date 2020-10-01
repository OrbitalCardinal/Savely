import 'package:flutter/material.dart';
import 'DividerAuth.dart';
import 'expandedBlueButton.dart';
import 'facebookCircularButton.dart';
import 'googleCircularButton.dart';
import 'noAccountRegister.dart';
import 'textFieldGrey.dart';
import 'textLogo.dart';
import './facebook_icon.dart';
import './google_icon.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                ),
                SizedBox(height: size.height / 40),
                TextFieldGrey(
                  labelText: "Contraseña",
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.cyan[300],
                  ),
                ),
                SizedBox(height: size.height / 25),
                ExpandedBlueButton(size: size),
                SizedBox(height: size.height / 45),
                Text(
                  "¿Olvidate tu contraseña?",
                  style: TextStyle(fontSize: 18, color: Colors.cyan[300]),
                ),
                SizedBox(height: size.height / 20),
              ],
            ),
          ),
          Container(
            width: size.width - size.width / 10,
            child: Column(
              children: [
                DividerAuth("  O también registrate con:  "),
                SizedBox(height: size.height / 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleCircularButton(size: size),
                    FacebookCircularButton(size: size),
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





