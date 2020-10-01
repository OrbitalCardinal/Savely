import 'package:flutter/material.dart';

import 'facebook_icon.dart';

class GoogleCircularButton extends StatelessWidget {
  const GoogleCircularButton({
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
        child: Icon(FacebookIcon.facebook, size: 24, color: Colors.cyan[300],),
        shape: CircleBorder(),
        onPressed: () {
          print("Facebook");
        },
      ),
    );
  }
}
