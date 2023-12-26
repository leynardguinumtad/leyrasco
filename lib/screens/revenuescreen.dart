import 'package:dbpracforfinals/data/lists.dart';
import 'package:dbpracforfinals/screens/homescreen.dart';
import 'package:flutter/material.dart';


class Revenuescreen extends StatefulWidget {
  Revenuescreen({Key? key, required this.revenues, required this.displayrev, required this.busname, required this.capital,
  required this.expenses, required this.expensesdisplay, required this.loans, required this.loansdisplay, required this.paidamount_inloans
  }) : super(key: key);

  String busname;
  double capital;
  double displayrev;
  double expensesdisplay;
  double loansdisplay;
  double paidamount_inloans;
  List<Revenue> revenues;
  List<Expenses> expenses;
  List<Loans> loans;

  @override
  State<Revenuescreen> createState() => _RevenuescreenState();
}

class _RevenuescreenState extends State<Revenuescreen> {
  double capitalincreased = 0;
  String busname = "hahahaa";
  TextEditingController revenuedescon = TextEditingController();
  TextEditingController revamountcon = TextEditingController(); 
  int ind = 0;
  List<Expenses> non = [];
  List<Loans> non2 = [];

  void showentry() {
    showModalBottomSheet(
        context: context,
        builder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Revenue/Sales Description',
                    ),
                    controller: revenuedescon,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Amount',
                    ),
                    keyboardType: TextInputType.number,
                    controller: revamountcon,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel')),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: addreventry, child: Text('Add'))
                    ],
                  )
                ],
              ),
            ));
  }

  void addreventry() {
  if (revenuedescon.text.isNotEmpty && revamountcon.text.isNotEmpty) {
    setState(() {
      double revAmount = double.parse(revamountcon.text);
      widget.revenues.add(Revenue(
        revamount: revAmount,
        revdescription: revenuedescon.text,
        revdate: DateTime.now(),
      ));
      widget.displayrev += revAmount;
      revenuedescon.clear();
      revamountcon.clear();
    });
    Navigator.pop(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Entry added successfully'),
        content: Text('Revenue added'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  } else {
    // Show "Please fill in the empty fields" alert
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Oopsss...'),
        content: Text('Please fill in the empty fields'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}


  // Function to remove an entry
   Future<bool> confirmDismiss(int index) async {
  bool userConfirmed = false;
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Remove Entry'),
      content: Text('Are you sure you want to remove this entry?'),
      actions: [
        TextButton(
          onPressed: () {
            // User canceled removal
            Navigator.pop(context, false);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // User confirmed to remove the entry
            userConfirmed = true;
            Navigator.pop(context, true);
          },
          child: Text('Yes'),
        ),
      ],
    ),
  );

  if (userConfirmed) {
    double removedAmount = widget.revenues[index].revamount;
    setState(() {
      widget.revenues.removeAt(index);
      widget.displayrev -= removedAmount;// Subtract revenue amount from the capital
    });
  }

  return userConfirmed;
}


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Mainscreen(capital: widget.capital, busname: widget.busname, 
                expensesdisplay: widget.expensesdisplay, revenusedisplay: widget.displayrev, loansdisplay: widget.loansdisplay, revlistcopy: widget.revenues, loanslistcopy: widget.loans,
                expenseslistcopy: widget.expenses, paidamount_inloans: widget.paidamount_inloans,)));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Your sales/revenues'),
          centerTitle: true,
        ),
        body: widget.revenues.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.money,
                      size: 50,
                      color: Colors.green,
                    ),
                    Text(
                      'Your sales made go here!',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 16, 88, 18),
                    ),
                    height: 150,
                    alignment: Alignment.center,
                    child: Text(
                      'P ${widget.displayrev}',
                      style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 179, 243, 188),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.revenues.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: Key(widget.revenues[index].revdate.toString()),
                          onDismissed: (direction) {
                            
                          },
                          confirmDismiss: (direction) async {
                            return confirmDismiss(index);
                          },
                          background: Container(
                            color: Colors.red,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 30,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          child: Card(
                              elevation: 10,
                              child: ListTile(
                                title: Text('${widget.revenues[index].revdescription}'),
                                subtitle:
                                    Text('Amount: ${widget.revenues[index].revamount}'),
                                trailing: Text('${widget.revenues[index].revdate}'),
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: showentry,
          child: Icon(Icons.add),
          tooltip: 'Enter sales made/revenue',
        ),
      ),
    );
  }
}
