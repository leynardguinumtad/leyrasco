import 'dart:io';
import 'package:dbpracforfinals/components/drawer.dart';
import 'package:dbpracforfinals/data/lists.dart';
import 'package:dbpracforfinals/screens/capitalentry.dart';
import 'package:dbpracforfinals/screens/expensesscree.dart';
import 'package:dbpracforfinals/screens/historyscreen.dart';
import 'package:dbpracforfinals/screens/loanscreen.dart';
import 'package:dbpracforfinals/screens/revenuescreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Mainscreen extends StatefulWidget {
  Mainscreen(
      {super.key,
      required this.capital,
      required this.busname,
      required this.expensesdisplay,
      required this.revenusedisplay,
      required this.loansdisplay,
      required this.revlistcopy,
      required this.expenseslistcopy,
      required this.loanslistcopy,
      required this.paidamount_inloans});

  double capital = 0;
  String busname = "";
  double revenusedisplay = 0;
  double expensesdisplay = 0;
  double loansdisplay = 0;
  List<Revenue> revlistcopy;
  List<Expenses> expenseslistcopy;
  List<Loans> loanslistcopy;
  double paidamount_inloans = 0;

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  double displaybudget = 0;
  final currencyFormat = NumberFormat.currency(
    symbol: '₱',
    decimalDigits: 2,
  );

  double getProfit() {
    return widget.revenusedisplay - widget.expensesdisplay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromARGB(255, 75, 152, 108),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'History'),
            ],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.jumpToPage(index);
              });
            },
          )),
      appBar: AppBar(
        title: Text(
          "${widget.busname}",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: Drawercom(businessname: widget.busname),
      body: PageView(controller: _pageController, children: [
        SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 75, 162, 108),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Current Budget',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              currencyFormat.format(widget.capital),
                              style: TextStyle(
                                fontSize: 27,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 75, 162, 108),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Current Profit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '₱ ${getProfit().toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Revenuescreen(
                                      revenues: widget.revlistcopy,
                                      displayrev: widget.revenusedisplay,
                                      busname: widget.busname,
                                      capital: widget.capital,
                                      expenses: widget.expenseslistcopy,
                                      loans: widget.loanslistcopy,
                                      expensesdisplay: widget.expensesdisplay,
                                      loansdisplay: widget.loansdisplay,
                                      paidamount_inloans:
                                          widget.paidamount_inloans,
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 51, 106,
                            74), 
                        minimumSize:
                            Size(double.infinity, 50), // Set width and height
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Revenues',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            currencyFormat.format(widget.revenusedisplay),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Expensesscreen(
                                      expenses: widget.expenseslistcopy,
                                      revcopy: widget.revlistcopy,
                                      loanscopy: widget.loanslistcopy,
                                      expensesdisplay: widget.expensesdisplay,
                                      revdisplay: widget.revenusedisplay,
                                      loansdisplay: widget.loansdisplay,
                                      businessname: widget.busname,
                                      capital: widget.capital,
                                      paidAmount: widget.paidamount_inloans,
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 196, 69,
                            77), // Set red color for Expenses button
                        minimumSize:
                            Size(double.infinity, 50), // Set width and height
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Expenses',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            currencyFormat.format(widget.expensesdisplay),
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loanscreen(
                                      businessname: widget.busname,
                                      capital: widget.capital,
                                      revenuelist: widget.revlistcopy,
                                      expenseslist: widget.expenseslistcopy,
                                      loanlist: widget.loanslistcopy,
                                      revenue: widget.revenusedisplay,
                                      expense: widget.expensesdisplay,
                                      loans: widget.loansdisplay,
                                      paidAmount: widget.paidamount_inloans,
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 243, 195,
                            68), // Set grey color for Loans button
                        minimumSize:
                            Size(double.infinity, 50), // Set width and height
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Loans',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(currencyFormat.format(widget.loansdisplay),
                              style: TextStyle(
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
        Historyscreen(
          histloans: widget.loanslistcopy,
          histexpenses: widget.expenseslistcopy,
          histrevenue: widget.revlistcopy,
        )
      ]),
    );
  }
}
