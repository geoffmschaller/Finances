import 'package:flutter/material.dart';

import 'package:Finances/models/transaction.dart';
import '../components/transactionListElement.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _transactions.isEmpty
          ? Center(
              child: Text(
                "No transactions yet",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 15,
                ),
              ),
            )
          : Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TransactionListElement(_transactions[index]);
                },
                itemCount: _transactions.length,
              ),
            ),
    );
  }
}
