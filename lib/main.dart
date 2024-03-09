import 'package:flutter/material.dart';
import 'package:quotes_app_flutter/pages/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:const Color.fromARGB(255, 15, 18, 47),
      ),        
      home: const Center(
        child: HomeScreen()
      ),
    );
  }
}
