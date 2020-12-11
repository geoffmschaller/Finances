import 'package:Finances/components/ChartBar.dart';
import 'package:Finances/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartDisplay extends StatelessWidget {
  final List<Transaction> _transactions;

  ChartDisplay(this._transactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < _transactions.length; i++) {
        if (_transactions[i].date.day == weekDay.day &&
            _transactions[i].date.month == weekDay.month &&
            _transactions[i].date.year == weekDay.year) {
          totalSum += _transactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get _maxSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: groupedTransactionValues.map(
            (data) {
              return ChartBar(
                data['day'],
                data['amount'],
                _maxSpending == 0
                    ? 0
                    : (data['amount'] as double) / _maxSpending,
              );
            },
          ).toList(),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
