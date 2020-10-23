import 'package:flutter/material.dart';

import 'loginBackground.dart';

class AccountLogin extends StatelessWidget {
  const AccountLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "¿Ya tienes una cuenta?",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            GestureDetector(
              child: Text(
                " Inicia sesión",
                style: TextStyle(fontSize: 18, color: Colors.cyan[300]),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
                  return LoginBackground();
                }));
              },
            ),
          ],
        ),
      ],
    );
  }
}
