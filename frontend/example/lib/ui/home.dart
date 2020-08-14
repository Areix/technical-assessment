import 'package:flutter/material.dart' hide Actions;

import '../model/expense.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Areix Ledger'),
        actions: <Widget>[SettingsButton()],
      ),
      body: Transactions(),
      floatingActionButton: AddTransactionButton(),
    );
  }
}

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Transaction transactions = new Transaction('2020-02-02','txn 1',List<Posting>());
    List<Expense> expenses = new List<Expense>();
    expenses = [
      new Expense(recordId:'1',name:'Dinning in McD', amount:121.3,category:'Home',createdAt:'2020-02-02'),
      new Expense(recordId:'2',name:'Shopping in the mall', amount:314.3,category:'Financials',createdAt:'2020-02-12'),
      new Expense(recordId:'3',name:'Pay for tax', amount:1545.3,category:'Leisure',createdAt:'2020-02-03'),
    ];

    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 1.0,
          child: RefreshIndicator(
            onRefresh: () {},
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: expenses.length, // transactions.length
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: EdgeInsets.fromLTRB(4, (index == 0) ? 8 : 0, 4,
                    (index == expenses.length - 1) ? 8 : 0), // txn length!!!!!!
                child: Card(
                  color: Colors.blueGrey,
                  elevation: 3,
                  child: InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: FormattedJournalItem(
                        expense: expenses[index],
                        dark: Theme.of(context).brightness == Brightness.dark,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FormattedJournalItem extends StatelessWidget {
  const FormattedJournalItem({@required this.expense, @required this.dark});

  final Expense expense;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    Widget formattedJournalItem;
      final Color color = Colors.white;

    if (expense is Expense) {
      final String date = expense.createdAt;
      final String name = expense.name;
      final String category = expense.category;
      final double amount = expense.amount;
      final Widget column = Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              FormatString(
                text: date,
                color: color,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          // const FormatString(text: ' '),
                          SizedBox(width: 20,),
                          FormatString(
                            text: name,
                            color: color,
                          ),
                          // const FormatString(text: '   '),
                          SizedBox(width: 20,),
                          FormatString(
                            text: '\$',
                            color: color,
                          ),
                          FormatString(
                            text: amount.toString(),
                            color: color,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const FormatString(text: ' '),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const FormatString(text: ' '),
                          FormatString(
                            text: category,
                            color: color,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
      formattedJournalItem = column;
    }
    return formattedJournalItem;
  }
}

class FormatString extends StatelessWidget {
  const FormatString({@required this.text, this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
      ),
      style: TextStyle(
        // fontFamily: 'IBMPlexMono',
        color: color,
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('Settings'),
      icon: const Icon(Icons.settings),
      onPressed: () {
        // Navigator.pushNamed(context, '/settings');
        print('navigate to setting');
      },
    );
  }
}

class AddTransactionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: '''the only floating action button here ${DateTime.now().millisecondsSinceEpoch}''',
      onPressed: () {
        print('FloatingActionButton got pressed');
        Navigator.pushNamed<dynamic>(context, '/new_expense');
      },
      child: const Icon(Icons.add),
    );
  }
}
