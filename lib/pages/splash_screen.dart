import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = .5;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () {
        setState(() {
          _scale = 1.6;
        });
      },
    );
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedScale(
          duration: Duration(seconds: 3),
          curve: Curves.bounceOut,
          scale: _scale,
          child: Logo(),
        ),
      ),
    );
  }
}
