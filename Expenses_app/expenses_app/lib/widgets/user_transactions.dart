// ignore_for_file: unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transactions_list.dart';
import '../models/transaction.dart';

var counter = 0;

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: "1",
      title: "Fatura do cartão de crédito",
      amount: 199.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "Mesalidade da Academia",
      amount: 60.00,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String transactionName, double transactionAmount) {
    final newTransaction = Transaction(
        id: counter.toString(),
        title: transactionName,
        amount: transactionAmount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTransaction);
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransationList(_userTransaction),
      ],
    );
  }
}
