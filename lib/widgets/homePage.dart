import 'package:Savely/widgets/history-screen.dart';
import 'package:Savely/widgets/loan-scree.dart';
import 'package:Savely/widgets/profile-screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'homepage';

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
                    child: Icon(
                      Icons.monetization_on,
                    ),
                  ),
                  Tab(
                    child: Icon(
                      Icons.book,
                    ),
                  ),
                  Tab(
                    child: Icon(
                      Icons.person,
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
