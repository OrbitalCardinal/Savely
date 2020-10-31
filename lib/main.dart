import 'package:Savely/widgets/history-screen.dart';
import 'package:Savely/widgets/homePage.dart';
import 'package:Savely/widgets/loan-screen.dart';
import 'package:Savely/widgets/profile-screen.dart';
import 'package:Savely/widgets/signup-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/loginBackground.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savely',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.deepOrange[400],
        backgroundColor: Colors.grey[800],
      ),
      // home: LoginBackground(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => LoginBackground(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        LoanScreen.routeName: (ctx) => LoanScreen(),
        HistoryScreen.routeName: (ctx) => HistoryScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        HomePage.routeName: (ctx) => HomePage()
      },
    );
  }
}
