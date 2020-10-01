import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  LoginBackground({this.size, this.loginChild});
  final Widget loginChild;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack (
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            'assets/images/loguptri.png',
            width: size.width,
          ),
        ),
        Positioned(
          top: size.height - 112,
          child: Image.asset(
            'assets/images/logdowntri.png',
            width: size.width,
          ),
        ),
        loginChild,
        
      ],
    );
  }
}
