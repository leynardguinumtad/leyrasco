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
      backgroundColor: Color.fromARGB(255, 101, 91, 247),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 88, 248),
        title: Center(
          child: Text('CashFlowMate', style: TextStyle(
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
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              elevation: 10,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Center(
                          child: Text('Enter your business name', 
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          ),
                        ),
                        subtitle: Center(child: Text("eg. Arnie's Cooking Class")),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: bnameinput,
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                     SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        bname = bnameinput.text;
                      });
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => Entercapitalscreen(businessname: bname,))
                      );
                    }, 
                    child: Text('Next'))
                    ]),
                     )
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