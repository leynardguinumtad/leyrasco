import 'package:flutter/material.dart';

class Drawercom extends StatelessWidget {
  const Drawercom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            const DrawerHeader(
              child: Center(
              child: Text('CashFlowMate'),
            )
            ),
            ListTile(
              title: Text('Exit Application'),
              onTap: (){},
              hoverColor: Colors.red,            
              )
          ],
        ),
      );
  }
}