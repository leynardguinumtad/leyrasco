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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          'CashFlowMate',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Center(
                        child: Text(
                          "What is ${widget.businessname}'s budget for today?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          "e.g., 10000",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        prefix: Text('P'),
                        suffix: Text('.00'),
                        labelText: 'Enter Budget',
                        border: OutlineInputBorder(),
                      ),
                      controller: capitalcon,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        cap = double.parse(capitalcon.text);
                        setState(() {});
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mainscreen(
                              capital: cap,
                              busname: widget.businessname,
                              expensesdisplay: 0,
                              revenusedisplay: 0,
                              loansdisplay: 0,
                              revlistcopy: emptyrev,
                              expenseslistcopy: emptyexpenses,
                              loanslistcopy: emptyloans,
                              paidamount_inloans: 0,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
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
          ),
        ],
      ),
    );
  }
}
