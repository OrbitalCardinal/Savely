import 'package:Savely/widgets/registerBody.dart';
import 'package:flutter/material.dart';

class NoAccountRegister extends StatelessWidget {
  const NoAccountRegister({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return RegisterBody();
            }));
          },
        ),
      ],
    );
  }
}
