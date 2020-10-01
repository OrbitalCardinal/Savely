import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savely',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.grey[800],
        child: Stack (
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
            LoginBody(size: size),
            
          ],
        ),
      ),
    );
  }
}


