import 'package:flutter/material.dart';

class CreateTransaction extends StatelessWidget {
  final TextEditingController _titleController;
  final TextEditingController _amountController;
  final Function _createNewTransaction;

  CreateTransaction(this._titleController, this._amountController,
      this._createNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: _titleController,
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
              onPressed: () {
                _createNewTransaction();
              },
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Theme.of(context).primaryColor,
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
        padding: EdgeInsets.all(10),
        height: 200,
      ),
    );
  }
}
