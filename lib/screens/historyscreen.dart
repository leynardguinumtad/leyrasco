import 'package:dbpracforfinals/data/lists.dart';
import 'package:flutter/material.dart';

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
          Center(child: Text('Transactions')),
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
                    Icons.account_balance,
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
    if (title == "Revenues") {
      return Text(
        'You earned P ${transaction.revamount} for ${transaction.revdescription}',
        style: TextStyle(color: Colors.white),
      );
    } else if (title == "Loans") {
      String loanStatus = transaction.isPaid ? 'paid' : 'unpaid';
      String paymentInfo = transaction.isPaid ? ' (Paid P ${transaction.loanamount})' : '';
      return Text(
        '${transaction.borrowername} has P ${transaction.loanamount} $loanStatus loan$paymentInfo',
        style: TextStyle(color: Colors.white),
      );
    } else if (title == "Expenses") {
      return Text(
        'You used P ${transaction.expensesamount} of your budget for ${transaction.expensesdescription}',
        style: TextStyle(color: Colors.white),
      );
    }

    return Text('Unknown transaction type');
  }

  Widget _buildSubtitle(dynamic transaction, String title) {
    if (title == "Revenues") {
      return Text('Date: ${transaction.revdate}', style: TextStyle(color: Colors.white));
    } else if (title == "Loans") {
      return Text('Date: ${transaction.loandate}', style: TextStyle(color: Colors.white));
    } else if (title == "Expenses") {
      return Text('Date: ${transaction.expensesdate}', style: TextStyle(color: Colors.white));
    }

    return Text('Unknown transaction type');
  }
}
