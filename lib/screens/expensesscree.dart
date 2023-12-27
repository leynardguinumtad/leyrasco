import 'package:dbpracforfinals/data/lists.dart';
import 'package:dbpracforfinals/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Expensesscreen extends StatefulWidget {
  Expensesscreen({Key? key, required this.expenses, required this.revcopy, required this.loanscopy,
  required this.expensesdisplay, required this.revdisplay, required this.loansdisplay, required this.capital,
  required this.businessname, required this.paidAmount
  });

  List<Expenses> expenses;
  List<Revenue> revcopy;
  List<Loans> loanscopy;
  String businessname;
  double capital;
  double revdisplay;
  double expensesdisplay;
  double loansdisplay;
  double paidAmount;

  @override
  State<Expensesscreen> createState() => _ExpensesscreenState();
}

class _ExpensesscreenState extends State<Expensesscreen> {

  TextEditingController expensesdescon = TextEditingController();
  TextEditingController expensesamountcon = TextEditingController();
  int ind = 0;
  double capitalvaluedisplayinmain = 0;
  final dateTimeFormat = DateFormat('y/MM/dd hh:mm a');
  final currencyFormat = NumberFormat.currency(
      symbol: '₱',
      decimalDigits: 2,
    );

  void showentry() {
    showModalBottomSheet(
        context: context,
        builder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Expense Description',
                    ),
                    controller: expensesdescon,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefix: Text('₱'),
                      labelText: 'Enter Amount',
                    ),
                    keyboardType: TextInputType.number,
                    controller: expensesamountcon,
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
                          onPressed: addExpenseEntry, child: Text('Add'))
                    ],
                  )
                ],
              ),
            ));
  }

  void addExpenseEntry() {
  if (expensesdescon.text.isNotEmpty && expensesamountcon.text.isNotEmpty) {
    double expenseAmount = double.parse(expensesamountcon.text);

    // Check if the expense can be covered by the budget
    if (widget.capital >= expenseAmount) {
      setState(() {
        widget.expenses.add(Expenses(
          expensesamount: expenseAmount,
          expensesdescription: expensesdescon.text,
          expensesdate: DateTime.now(),
        ));
        widget.expensesdisplay += expenseAmount;
        widget.capital -= expenseAmount;
        expensesdescon.clear();
        expensesamountcon.clear();
      });

      Navigator.pop(context);

      // Show "ExpenseAdded" alert
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Entry added successfully'),
          content: Text('Expense added'),
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
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Budget Insufficient'),
          content: Text('The expense cannot be covered by the budget.'),
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
      double removedAmount = widget.expenses[index].expensesamount;
      setState(() {
        widget.expenses.removeAt(index);
        widget.expensesdisplay -= removedAmount;
        widget.capital += removedAmount;
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
                builder: (context) => Mainscreen(capital: widget.capital, busname: widget.businessname, 
                expensesdisplay: widget.expensesdisplay, revenusedisplay: widget.revdisplay, loansdisplay: widget.loansdisplay, 
                revlistcopy: widget.revcopy, loanslistcopy: widget.loanscopy,
                expenseslistcopy: widget.expenses, paidamount_inloans: widget.paidAmount,)));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Business Expenses'),
        ),
        body: widget.expenses.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt,
                      size: 50,
                      color: Color.fromARGB(255, 233, 11, 11),
                    ),
                    Text(
                      'Your expenses go here!',
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
                      color: Color.fromARGB(255, 199, 3, 3),
                    ),
                    height: 150,
                    alignment: Alignment.center,
                    child: Text(
                      currencyFormat.format(widget.expensesdisplay),
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
                      itemCount: widget.expenses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: Key(widget.expenses[index].expensesdate.toString()),
                          onDismissed: (direction) {
                            // Intentionally left empty
                          },
                          confirmDismiss: (direction) async {
                            // Show an alert to confirm removal
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
                                title: Text('${widget.expenses[index].expensesdescription}'),
                                subtitle:
                                    Text('Amount: ${currencyFormat.format(widget.expenses[index].expensesamount)}'),
                                trailing: Text('Date: ${dateTimeFormat.format(widget.expenses[index].expensesdate)}'),
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
          tooltip: 'Enter your expenses',
        ),
      ),
    );
  }
}
