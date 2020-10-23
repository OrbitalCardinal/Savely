import 'package:Savely/widgets/signup-screen.dart';
import 'package:flutter/material.dart';

class NoAccountRegister extends StatelessWidget {
  const NoAccountRegister({
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
              "¿No tienes una cuenta?",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            GestureDetector(
              child: Text(
                " Registrate",
                style: TextStyle(fontSize: 18, color: Colors.cyan[300]),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignupScreen.routeName);
              },
            ),
          ],
        ),
      ],
    );
  }
}
