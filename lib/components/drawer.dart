import 'package:dbpracforfinals/screens/changecapital.dart';
import 'package:flutter/material.dart';

class Drawercom extends StatefulWidget {
   Drawercom({super.key, required this.businessname});

  String businessname;

  @override
  State<Drawercom> createState() => _DrawercomState();
}

class _DrawercomState extends State<Drawercom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            const DrawerHeader(
              child: Center(
              child: Text('CashFlowMate',
              style: TextStyle(
                color: Colors.white,
              ),
              ),
            )
            ),
            ListTile(
              textColor: Colors.white,
              title: Text('Change budget'),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Changecapitalscreen(businessname: widget.businessname))));
              },
              hoverColor: Colors.blue,
            ),
            ListTile(
              textColor: Colors.white,
              title: Text('Exit Application'),
              onTap: (){},
              hoverColor: Colors.red,            
              )
          ],
        ),
      );
  }
}