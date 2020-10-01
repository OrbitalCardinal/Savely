import 'package:flutter/material.dart';

class ExpandedBlueButton extends StatelessWidget {
  const ExpandedBlueButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () {
          print("Iniciar Sesión");
        },
      ),
    );
  }
}