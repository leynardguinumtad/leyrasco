import 'package:dbpracforfinals/data/lists.dart';
import 'package:dbpracforfinals/screens/homescreen.dart';
import 'package:flutter/material.dart';

class Changecapitalscreen extends StatefulWidget {
   Changecapitalscreen({super.key, required this.businessname});

  String businessname = "";

  @override
  State<Changecapitalscreen> createState() => _ChangecapitalscreenState();
}

  double cap = 0;
  TextEditingController capitalcon = TextEditingController();
  List<Revenue> emptyrev = [];
  List<Expenses> emptyexpenses = [];
  List<Loans> emptyloans = [];

class _ChangecapitalscreenState extends State<Changecapitalscreen> {
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
                          child: Text("What will be ${widget.businessname}'s new budget?", 
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          ),
                        ),
                        subtitle: Center(child: Text("Enter your new budget")),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefix: Text('P'),
                        suffix: Text('.00'),
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
                      Navigator.pushReplacement(context, 
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