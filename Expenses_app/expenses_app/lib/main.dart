// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_print

import 'package:flutter/material.dart';
import 'package:expenses_app/transaction.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors, must_be_immutable
class MyHomePage extends StatelessWidget {
  final List<Transaction> transactionsMade = [
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

  // late String inputAmount = 'null';
  // late String inputTitle = 'null';
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PagDívidas'),
        backgroundColor: Color.fromARGB(255, 1, 62, 228),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // ignore: prefer_const_literals_to_create_immutables
          Card(
            // ignore: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
            child: Container(
              padding: const EdgeInsets.all(8),
              // ignore: duplicate_ignore
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    // ignore: prefer_const_constructors, duplicate_ignore
                    TextField(
                      // ignore: prefer_const_constructors
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
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      // ignore: prefer_const_literals_to_create_immutables
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
                        // ignore: avoid_print
                        //print(inputAmount);
                        //print(inputTitle);
                        print(titleController.text);
                        print(amountController.text);
                      },
                      child: Text('Inserir transação'),
                    ),
                  ]),
            ),
          ),
          Column(
            children: transactionsMade.map((transaction) {
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
                              color: Color.fromARGB(255, 226, 10, 10),
                              width: 2)),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'R\$${transaction.amount}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 226, 10, 10)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(transaction.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          'Compra em: ${DateFormat('dd/MM/yyyy').format(transaction.date)}',
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
