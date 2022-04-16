import 'package:flutter/material.dart';
import 'dart:math';
import 'facts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        body: const Facts(),
      ),
    );
  }
}

class Facts extends StatefulWidget {
  const Facts({Key? key}) : super(key: key);

  @override
  State<Facts> createState() => _FactsState();
}

class _FactsState extends State<Facts> {
  // Number of array position for random facts
  int factNum = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent), // no splash or highlights
              minimumSize: MaterialStateProperty.all(const Size(double.infinity, double.infinity)), // max button size
            ),

            child: Text(
              facts[factNum],
              style: const TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              setState(() {
                factNum = Random().nextInt(1005);
              });
            }),
      ),
    );
  }
}
