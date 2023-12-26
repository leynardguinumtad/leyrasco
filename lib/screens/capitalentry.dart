import 'package:dbpracforfinals/data/lists.dart';
import 'package:dbpracforfinals/screens/homescreen.dart';
import 'package:flutter/material.dart';

class Entercapitalscreen extends StatefulWidget {
   Entercapitalscreen({super.key, required this.businessname});

  String businessname = "";

  @override
  State<Entercapitalscreen> createState() => _EntercapitalscreenState();
}

  double cap = 0;
  TextEditingController capitalcon = TextEditingController();
  List<Revenue> emptyrev = [];
  List<Expenses> emptyexpenses = [];
  List<Loans> emptyloans = [];

class _EntercapitalscreenState extends State<Entercapitalscreen> {
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
              elevation: 10,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Center(
                          child: Text("What is ${widget.businessname}'s budget for today?", 
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          ),
                        ),
                        subtitle: Center(child: Text("eg. 10000")),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                      controller: capitalcon,
                    ),
                     SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(onPressed: (){
                      cap = double.parse(capitalcon.text);
                      setState(() {
                        
                      });
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=> Mainscreen(capital: cap, busname: widget.businessname, expensesdisplay: 0, revenusedisplay: 0, loansdisplay: 0, revlistcopy: emptyrev, 
                      expenseslistcopy: emptyexpenses, loanslistcopy: emptyloans, paidamount_inloans: 0,)));
                    }, child: Text('Next'))
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