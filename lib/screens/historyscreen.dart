import 'package:dbpracforfinals/data/lists.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Historyscreen extends StatelessWidget {
  Historyscreen({
    Key? key,
    required this.histloans,
    required this.histrevenue,
    required this.histexpenses,
  });

  final List<Loans> histloans;
  final List<Revenue> histrevenue;
  final List<Expenses> histexpenses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildList("Revenues", histrevenue, Colors.lightGreen),
          _buildList("Expenses", histexpenses, const Color.fromARGB(255, 223, 104, 95)),
          _buildList("Loans", histloans, Colors.grey),
        ],
      ),
    );
  }

  Widget _buildList(String title, List<dynamic> transactions, Color backgroundColor) {
    return Expanded(
      child: transactions.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 50,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  Text(
                    'Your future $title are seen here!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Text(title),
                Expanded(
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: backgroundColor,
                        child: ListTile(
                          title: _buildTitle(transactions[index], title),
                          subtitle: _buildSubtitle(transactions[index], title),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildTitle(dynamic transaction, String title) {
    final currencyFormat = NumberFormat.currency(
      symbol: '₱',
      decimalDigits: 2,
    );

    if (title == "Revenues") {
      return Text(
        'You earned ${currencyFormat.format(transaction.revamount)} for ${transaction.revdescription}',
        style: TextStyle(color: Colors.white),
      );
    } else if (title == "Loans") {
      String loanStatus = transaction.isPaid ? 'paid' : 'unpaid';
      String paymentInfo = transaction.isPaid ? ' (Paid ${currencyFormat.format(transaction.loanamount)})' : '';
      return Text(
        '${transaction.borrowername} has ${currencyFormat.format(transaction.loanamount)} $loanStatus loan$paymentInfo',
        style: TextStyle(color: Colors.white),
      );
    } else if (title == "Expenses") {
      return Text(
        'You used ${currencyFormat.format(transaction.expensesamount)} of your budget for ${transaction.expensesdescription}',
        style: TextStyle(color: Colors.white),
      );
    }

    return Text('Unknown transaction type');
  }

  Widget _buildSubtitle(dynamic transaction, String title) {
    final dateTimeFormat = DateFormat('y/MM/dd hh:mm a');

    if (title == "Revenues") {
      return Text('Date: ${dateTimeFormat.format(transaction.revdate)}', style: TextStyle(color: Colors.white));
    } else if (title == "Loans") {
      return Text('Date: ${dateTimeFormat.format(transaction.loandate)}', style: TextStyle(color: Colors.white));
    } else if (title == "Expenses") {
      return Text('Date: ${dateTimeFormat.format(transaction.expensesdate)}', style: TextStyle(color: Colors.white));
    }

    return Text('Unknown transaction type');
  }
}
