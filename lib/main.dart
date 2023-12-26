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
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Helloscreen(),
    );
  }
}