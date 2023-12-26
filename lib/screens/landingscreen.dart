import 'package:dbpracforfinals/screens/statebusinessname.dart';
import 'package:flutter/material.dart';

class Helloscreen extends StatefulWidget {
  const Helloscreen({super.key});

  @override
  State<Helloscreen> createState() => _HelloscreenState();
}

class _HelloscreenState extends State<Helloscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to CASHFLOW-mate', style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Enterbusinessscreen())
              );
            }, child: Text('Try our app')
            )
          ],
        ),
      ),
    );
  }
}