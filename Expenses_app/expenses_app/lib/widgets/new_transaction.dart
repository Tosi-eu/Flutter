// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final Function newTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.newTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                // onChanged: (value) => inputTitle = value,
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Nome da transação',
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              TextField(
                // onChanged: (value) => inputAmount = value,
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Valor da transação',
                  prefixIcon: const Icon(Icons.money),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 1, 62, 228)),
                onPressed: () {
                  //print(inputAmount);
                  //print(inputTitle);
                  //print(titleController.text);
                  //print(amountController.text);
                  newTransaction(titleController.text,
                      double.parse(amountController.text));
                },
                child: Text('Inserir transação'),
              ),
            ]),
      ),
    );
  }
}
