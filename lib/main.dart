import 'package:flutter/material.dart';
import 'dart:math';
import 'facts.dart';
import 'package:animated_background/animated_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.white,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.2,
    minOpacity: 0.03,
    maxOpacity: 0.1,
    particleCount: 12,
    spawnMaxRadius: 17.0,
    spawnMinRadius: 10.0,
    spawnMaxSpeed: 15.0,
    spawnMinSpeed: 5.0,
  );

  int factNum = 1; // for position in array

  static Color bgcolor = Colors.deepPurple.shade400;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgcolor,
        body: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(options: particles),
          child: Center(
            child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                      Colors.transparent), // no splash or highlights
                  minimumSize: MaterialStateProperty.all(const Size(
                      double.infinity, double.infinity)), // max button size
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
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
                ),
                onPressed: () {
                  setState(() {
                    factNum = Random().nextInt(1005);
                  });
                }),
          ),
        ),
      ),
    );
  }
}
