import 'package:dbpracforfinals/screens/statebusinessname.dart';
import 'package:flutter/material.dart';

class Helloscreen extends StatefulWidget {
  const Helloscreen({Key? key}) : super(key: key);

  @override
  State<Helloscreen> createState() => _HelloscreenState();
}

class _HelloscreenState extends State<Helloscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to CASHFLOW-mate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Enterbusinessscreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 child: const Text('Get Started!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
