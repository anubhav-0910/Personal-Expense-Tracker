import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  @override
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  '\nNo Transactions added yet !',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, idx) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(7),
                      child: FittedBox(
                        child: Text(
                          '${transaction[idx].amount.toStringAsFixed(2)} \₹',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(transaction[idx].title,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transaction[idx].date),
                    style: TextStyle(fontStyle: FontStyle.normal, fontSize: 11),
                  ),
                  trailing: MediaQuery.of(context).size.width > 412
                      ? TextButton.icon(
                          onPressed: () => deleteTx(transaction[idx].id),
                          icon: Icon(Icons.delete),
                          label: Text('Delete'))
                      : IconButton(
                          onPressed: () => deleteTx(transaction[idx].id),
                          icon: Icon(Icons.delete_sharp),
                          color: Color.fromARGB(255, 178, 175, 184),
                        ),
                ),
              );
            },
            itemCount: transaction.length,
          );
  }
}
