import 'package:dbpracforfinals/screens/homescreen.dart';
import 'package:dbpracforfinals/screens/landingscreen.dart';
import 'package:dbpracforfinals/screens/loanscreen.dart';
import 'package:dbpracforfinals/screens/revenuescreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Firstpage());
}

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: Helloscreen(),
    );
  }
}

ThemeData myTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto', 
  colorScheme: ColorScheme.fromSwatch().copyWith(
    background: const Color.fromARGB(255, 11, 25, 30),
    primary: const Color.fromARGB(255, 75, 152, 108),
    secondary: const Color.fromARGB(255, 146, 129, 99),
    tertiary: Color.fromARGB(255, 146, 129, 99)
    ),
);