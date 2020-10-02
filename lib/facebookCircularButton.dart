import 'package:flutter/material.dart';

import 'google_icon.dart';

class FacebookCircularButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width/7,
      child: RaisedButton(
        color: Colors.grey[600],
        child: Icon(GoogleIcon.google, size: 24, color: Colors.cyan[300],),
        shape: CircleBorder(),
        onPressed: () {
          print("google");
        },
      ),
    );
  }
}