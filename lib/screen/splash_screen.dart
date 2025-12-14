import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearProgressIndicator(
          color: Colors.orange,
          minHeight: 15,
        ),
      ),
    );
  }
}
