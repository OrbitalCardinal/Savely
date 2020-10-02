import 'package:flutter/material.dart';

import '../facebookCircularButton.dart';
import '../googleCircularButton.dart';
import 'DividerAuth.dart';
import 'accountLogIn.dart';
import 'expandedBlueButton.dart';
import 'textFieldGrey.dart';
import 'textLogo.dart';

class RegisterBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextLogo(),
            TextFieldGrey(
              labelText: "Nombre",
              pass: false,
              prefixIcon: Icon(Icons.person, color: Colors.cyan[300],),
            ),
            TextFieldGrey(
              labelText: "Email",
              pass: false,
              prefixIcon: Icon(Icons.alternate_email, color: Colors.cyan[300],),
            ),
            TextFieldGrey( 
              labelText: "Constraseña",
              pass: false,
              prefixIcon: Icon(Icons.vpn_key, color: Colors.cyan[300],),
            ),
            TextFieldGrey(
              labelText: "Confirmar contraseña",
              pass: false,
              prefixIcon: Icon(Icons.vpn_key, color: Colors.cyan[300],),
            ),
            ExpandedBlueButton(login: false,),
            DividerAuth('  O también registrate con:  '),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleCircularButton(),
                FacebookCircularButton(),
              ],
            ),
            AccountLogin()
          ],
        ),
      ),
    );
  }
}
