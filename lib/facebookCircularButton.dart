import 'package:flutter/material.dart';

import 'google_icon.dart';

class FacebookCircularButton extends StatelessWidget {
  const FacebookCircularButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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