import 'package:flutter/material.dart';

import 'Screens/home_screen.dart';

void main() {
  //LETS CONFUGURE OUR RED ERROR SCREEN
  ErrorWidget.builder = (FlutterErrorDetails details) => Material(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Center(
            child: Column(children: [
              Image.asset(
                'assets/images/cry.png',
                height: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Error',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(details.exceptionAsString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.normal))
            ]),
          ),
        ),
      );
//end off error screen configureation
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter BUDGET UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
