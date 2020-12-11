import 'package:Finances/components/ChartDisplay.dart';
import 'package:Finances/components/createTransaction.dart';
import 'package:Finances/components/transactionList.dart';
import 'package:Finances/models/transaction.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> _transactions = [];

  void createNewTransaction() {
    var parsedAmount = double.parse(amountController.text);
    if (titleController.text.isEmpty || parsedAmount < 0) {
      return;
    }
    var newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: titleController.text,
        amount: parsedAmount,
        date: DateTime.now());
    setState(() {
      _transactions.add(newTransaction);
    });
    titleController.clear();
    amountController.clear();
    Navigator.of(context).pop();
  }

  void startNewTransaction(context) {
    showModalBottomSheet(
      context: context,
      builder: (bctx) {
        return CreateTransaction(
          titleController,
          amountController,
          createNewTransaction,
        );
      },
    );
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finances"),
      ),
      body: Column(
        children: <Widget>[
          ChartDisplay(_recentTransactions),
          TransactionList(_transactions),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          startNewTransaction(context);
        },
      ),
    );
  }
}
