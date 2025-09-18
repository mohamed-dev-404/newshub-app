import 'package:flutter/material.dart';
import 'package:news_app/pages/splash_screen.dart';
import 'package:news_app/themes/light_theme.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

//!Required updates :
/**
 * Applay pagination concept 
 * add more categories (as API can)
 * display each article in details in seperated view (using Web view)
 * revision all project and new widgets and topic
 */
