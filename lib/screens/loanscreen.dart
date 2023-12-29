import 'package:dbpracforfinals/data/lists.dart';
import 'package:dbpracforfinals/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';

class Loanscreen extends StatefulWidget {
  Loanscreen({
    Key? key,
    required this.businessname,
    required this.capital,
    required this.revenuelist,
    required this.expenseslist,
    required this.loanlist,
    required this.revenue,
    required this.expense,
    required this.loans,
    required this.paidAmount,
  });

  String businessname;
  List<Revenue> revenuelist;
  List<Expenses> expenseslist;
  List<Loans> loanlist;
  double capital;
  double revenue;
  double expense;
  double loans;
  double paidAmount;

  @override
  State<Loanscreen> createState() => _LoanscreenState();
}

class _LoanscreenState extends State<Loanscreen> {
  TextEditingController borrowernamecon = TextEditingController();
  TextEditingController loanamountcon = TextEditingController();
  List<Loans> loans = [];
  int ind = 0;
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
                labelText: 'Customer Name/Address',
              ),
              controller: borrowernamecon,
            ),
            TextField(
              decoration: InputDecoration(
                prefix: Text('₱'),
                labelText: 'Amount to pay',
              ),
              keyboardType: TextInputType.number,
              controller: loanamountcon,
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
                  child: Text('Cancel'),
                ),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: addLoanEntry,
                  child: Text('Add'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void addLoanEntry() {
    if (borrowernamecon.text.isNotEmpty && loanamountcon.text.isNotEmpty) {
      setState(() {
        widget.loanlist.add(Loans(
          loanamount: double.parse(loanamountcon.text),
          borrowername: borrowernamecon.text,
          loandate: DateTime.now(),
        ));
        widget.loans += double.parse(loanamountcon.text);
        borrowernamecon.clear();
        loanamountcon.clear();
      });
      Navigator.pop(context);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Entry added successfully'),
          content: Text('Loan added'),
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
          backgroundColor: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Mainscreen(
              capital: widget.capital,
              busname: widget.businessname,
              expensesdisplay: widget.expense,
              revenusedisplay: widget.revenue,
              loansdisplay: widget.loans,
              revlistcopy: widget.revenuelist,
              loanslistcopy: widget.loanlist,
              expenseslistcopy: widget.expenseslist,
              paidamount_inloans: widget.paidAmount,
            ),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            'Business loans',
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                double totalPaidAmount = 0;
                for (var loan in widget.loanlist) {
                  if (loan.isPaid) {
                    totalPaidAmount += loan.loanamount;
                  }
                }

                setState(() {
                  widget.paidAmount = totalPaidAmount;
                  widget.loans = widget.loanlist
                      .where((loan) => !loan.isPaid)
                      .fold(0, (sum, loan) => sum + loan.loanamount);
                });

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text('Payment Confirmation'),
                    content: Text(
                        'Total Paid Amount: ${currencyFormat.format(totalPaidAmount)}'),
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
              },
              child: Text('Paid'),
            )
          ],
        ),
        body: widget.loanlist.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_balance,
                      size: 50,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Text(
                      'Your loans go here!',
                      style: TextStyle(
                        color: Colors.white,
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
                      color: Color.fromARGB(255, 243, 195, 68),
                    ),
                    height: 150,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            'To collect :',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            currencyFormat.format(widget.loans),
                            style: TextStyle(
                              color: Color.fromARGB(255, 129, 14, 6),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Paid : ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            currencyFormat.format(widget.paidAmount),
                            style: TextStyle(
                              color: Color.fromARGB(255, 105, 238, 123),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.loanlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 10,
                          child: ListTile(
                            textColor: Colors.white,
                            title: Column(
                              children: [
                                Text(
                                  'Customer name: ${widget.loanlist[index].borrowername}',
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'Amount to pay: ${currencyFormat.format(widget.loanlist[index].loanamount)}',
                                ),
                              ],
                            ),
                            subtitle: Text(
                                'Date: ${dateTimeFormat.format(widget.loanlist[index].loandate)}'),
                            trailing: Checkbox(
                              value: widget.loanlist[index].isPaid,
                              onChanged: widget.loanlist[index].isPaid
                                  ? null
                                  : (bool? value) {
                                      setState(() {
                                        widget.loanlist[index].isPaid =
                                            value ?? false;
                                      });
                                    },
                            ),
                            tileColor: widget.loanlist[index].isPaid
                                ? const Color.fromARGB(255, 13, 30, 35)
                                : const Color.fromARGB(255, 13, 30, 35),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: showentry,
          child: Icon(Icons.add),
          tooltip: 'Enter your loans',
        ),
      ),
    );
  }
}
