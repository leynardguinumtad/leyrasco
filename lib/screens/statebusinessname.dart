import 'package:dbpracforfinals/screens/capitalentry.dart';
import 'package:flutter/material.dart';

class Enterbusinessscreen extends StatefulWidget {
  Enterbusinessscreen({super.key});

  @override
  State<Enterbusinessscreen> createState() => _EnterbusinessscreenState();
}

String bname = "";
TextEditingController bnameinput = TextEditingController();

class _EnterbusinessscreenState extends State<Enterbusinessscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Center(
          child: Text(
            'CashFlowMate',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                        child: Text(
                          'Enter your business name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          "e.g., Arnie's Cooking Class",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: bnameinput,
                      decoration: InputDecoration(
                        labelText: 'Business Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          bname = bnameinput.text;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Entercapitalscreen(businessname: bname,),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
