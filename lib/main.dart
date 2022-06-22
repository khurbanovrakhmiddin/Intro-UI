import 'package:flutter/material.dart';

import 'home_page.dart';
import 'intro_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        HomePage.id: (context)=> const HomePage(),
        IntroPage.id : (context)=> const IntroPage(),
      },
    );
  }
}
