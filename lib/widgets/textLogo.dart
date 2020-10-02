import 'package:flutter/material.dart';

class TextLogo extends StatelessWidget {
  const TextLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Savely",
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'ABeeZee',
        fontSize: 45,
      ),
    );
  }
}