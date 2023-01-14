// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace
import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: unused_import
import './user_transactions.dart';

class TransationList extends StatelessWidget {
  final List<Transaction> transactions;

  TransationList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 238,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 226, 10, 10), width: 2)),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'R\$${transactions[index].amount}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 226, 10, 10)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transactions[index].title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(
                      'Compra em: ${DateFormat('dd/MM/yyyy').format(transactions[index].date)}',
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
