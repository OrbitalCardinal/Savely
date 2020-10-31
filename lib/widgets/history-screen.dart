import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static const routeName = 'history-screen';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Historial',
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}
