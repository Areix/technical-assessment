import 'package:flutter/material.dart' hide Actions;

import 'ui/home.dart';
import 'ui/new_expense.dart';
// import 'src/settings.dart';

void main() {
  runApp(LedgerApp());
}


class LedgerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ledger',
          theme: ThemeData(
                  primarySwatch: Colors.blueGrey,
                  accentColor: Colors.blueGrey,
                ),
          routes: <String, Widget Function(BuildContext)>{
            '/': (BuildContext context) => Home(),
            '/new_expense': (BuildContext context) => NewExpenseScreen(),
            // '/settings': (BuildContext context) => Settings(),
          },
        );
  }
}
