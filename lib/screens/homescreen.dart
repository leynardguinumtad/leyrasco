import 'dart:io';
import 'package:dbpracforfinals/components/drawer.dart';
import 'package:dbpracforfinals/data/lists.dart';
import 'package:dbpracforfinals/screens/capitalentry.dart';
import 'package:dbpracforfinals/screens/expensesscree.dart';
import 'package:dbpracforfinals/screens/historyscreen.dart';
import 'package:dbpracforfinals/screens/loanscreen.dart';
import 'package:dbpracforfinals/screens/revenuescreen.dart';
import 'package:flutter/material.dart';



class Mainscreen extends StatefulWidget {
  Mainscreen({super.key, required this.capital, required this.busname, required this.expensesdisplay,
  required this.revenusedisplay, required this.loansdisplay, required this.revlistcopy, required this.expenseslistcopy,
  required this.loanslistcopy, required this.paidamount_inloans
  });

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromARGB(255, 36, 33, 43),
        ),
        child: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white,
      currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            });
          },
    )
        ),
      appBar: AppBar(
        title: Text("${widget.busname}"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 72, 163, 236),
      ),
      drawer: Drawercom(),
      body: PageView(
        controller: _pageController,
        children: [
          SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                    Container(
                    width: 250.0,
                    height: 250.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('Current Budget', style: TextStyle(
                              fontSize: 20, 
                            ),),
                            SizedBox(
                              height: 50,
                            ),
                            Text('₱ ${widget.capital}', style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(
                height: 30,
              ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, 
                            MaterialPageRoute(builder: (context) => Revenuescreen(revenues: widget.revlistcopy, displayrev: widget.revenusedisplay,
                            busname: widget.busname, capital: widget.capital, expenses: widget.expenseslistcopy, loans: widget.loanslistcopy,
                            expensesdisplay: widget.expensesdisplay, loansdisplay: widget.loansdisplay, paidamount_inloans: widget.paidamount_inloans,
                            ))
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green, // Set green color for Revenue button
                            minimumSize: Size(double.infinity, 50), // Set width and height
                          ),
                          child: Column(
                            children: [
                              Text('Revenues', style: TextStyle(
                                fontSize: 17,
                              color: Colors.white
                              ),),
                              Text('P ${widget.revenusedisplay}')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => Expensesscreen(expenses: widget.expenseslistcopy, revcopy: widget.revlistcopy,
                            loanscopy: widget.loanslistcopy, expensesdisplay: widget.expensesdisplay, revdisplay: widget.revenusedisplay,
                            loansdisplay: widget.loansdisplay, businessname: widget.busname, capital: widget.capital, paidAmount: widget.paidamount_inloans,
                            ))
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // Set red color for Expenses button
                            minimumSize: Size(double.infinity, 50), // Set width and height
                          ),
                          child: Column(
                            children: [
                              Text('Expenses', style: TextStyle(
                                fontSize: 17,
                              color: Colors.white
                              ),),
                              Text('${widget.expensesdisplay}', style: TextStyle(
                                color: Colors.white
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Add some spacing between buttons
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context) => Loanscreen(businessname: widget.busname,
                            capital: widget.capital, revenuelist: widget.revlistcopy, expenseslist: widget.expenseslistcopy, loanlist: widget.loanslistcopy,
                            revenue: widget.revenusedisplay, expense: widget.expensesdisplay, loans: widget.loansdisplay,
                            paidAmount: widget.paidamount_inloans,
                            ))
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey, // Set grey color for Loans button
                            minimumSize: Size(double.infinity, 50), // Set width and height
                          ),
                          child: Column(
                            children: [
                              Text('Loans', style: TextStyle(
                                fontSize: 17,
                              color: Colors.white
                              ),),
                              Text('${widget.loansdisplay}')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ],
          )
        ),
        Historyscreen(histloans: widget.loanslistcopy, histexpenses: widget.expenseslistcopy, histrevenue: widget.revlistcopy,)
        ]
      ),
    );
  }
}