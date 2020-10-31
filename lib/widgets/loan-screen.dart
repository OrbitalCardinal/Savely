import 'dart:math';

import 'package:Savely/models/loan.dart';
import 'package:Savely/widgets/newLoan.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'loanCard.dart';

class LoanScreen extends StatefulWidget {
  static const routeName = 'loan-screen';

  @override
  _LoanScreenState createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {

  void _startAddNewLoan(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return GestureDetector(
            child: NewLoan(addLoan),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: HomePage.tempLoans.isEmpty ? Center(child: Text('No existen prestamos activos', style: TextStyle(color: Colors.white),),) : Container(
        child: ListView.builder(
          itemCount: HomePage.tempLoans.length,
          itemBuilder: (context, index) {
            return LoanCard(
                id: HomePage.tempLoans[index].id,
                name: HomePage.tempLoans[index].name,
                initialDate: HomePage.tempLoans[index].initialDate,
                finalDate: HomePage.tempLoans[index].finalDate,
                amount: HomePage.tempLoans[index].amount,
                deleteFunct: deleteLoan);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: () {
            _startAddNewLoan(context);
          }),
    );
  }

  addLoan(String name, String amount, DateTime initalDate, DateTime finalDate) {
    setState(() {
      HomePage.tempLoans.add(Loan(
        id: Random().nextInt(100).toString(),
        name: name,
        amount: double.parse(amount),
        initialDate: initalDate,
        finalDate: finalDate,
      ));
    });
    Navigator.of(context).pop();
  }

  deleteLoan(String id) {
    setState(() {
      HomePage.tempLoans.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }
}
