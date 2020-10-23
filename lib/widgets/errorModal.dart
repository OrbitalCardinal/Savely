import 'package:flutter/material.dart';

class ErrorModal extends StatelessWidget {
  final text;
  ErrorModal(this.text);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(text),
      actions: [
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
