import 'package:flutter/cupertino.dart';

class Loan {
  final String id;
  final String name;
  final DateTime initialDate;
  final DateTime finalDate;
  final double amount;

  Loan({
    @required this.id,
    @required this.name,
    @required this.initialDate,
    @required this.finalDate,
    @required this.amount
  });
}