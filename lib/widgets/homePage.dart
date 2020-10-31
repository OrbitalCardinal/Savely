import 'package:Savely/models/loan.dart';
import 'package:Savely/widgets/history-screen.dart';
import 'package:Savely/widgets/loan-screen.dart';
import 'package:Savely/widgets/profile-screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'homepage';
  static List<Loan> tempLoans = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: TabBar(
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Theme.of(context).backgroundColor,
                tabs: [
                  Tab(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: 6,),
                          Icon(
                            Icons.monetization_on,
                          ),
                          Text('Activos')
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Column(
                      children: [
                        SizedBox(height: 6,),
                        Icon(
                          Icons.book,
                        ),
                        Text('Historial')
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      children: [
                        SizedBox(height: 6,),
                        Icon(
                          Icons.person,
                        ),
                        Text('Perfil')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
        ),
        body: TabBarView(children: [
          LoanScreen(),
          HistoryScreen(),
          ProfileScreen(),
        ]),
      ),
    );
  }
}
