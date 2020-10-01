import 'package:flutter/material.dart';

class DividerAuth extends StatelessWidget {
  final String dividerText;

  DividerAuth(this.dividerText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[400],
          ),
        ),
        Text(dividerText,
            style: TextStyle(color: Colors.white, fontSize: 18)),
        Expanded(
          child: Divider(
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
