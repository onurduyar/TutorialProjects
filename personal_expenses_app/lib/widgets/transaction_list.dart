import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {required this.userTransactions, required this.deleteTx, Key? key})
      : super(key: key);
  final List<Transaction> userTransactions;
  final Function deleteTx;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: userTransactions.isEmpty
          ? LayoutBuilder(builder: ((context, constraints) {
              return Column(
                children: [
                  Text(
                    'No transaction added yet!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            }))
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(userTransactions[index].id),
                  onDismissed: (direction) {
                    deleteTx(userTransactions[index].id);
                  },
                  child: Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            child: Text(
                              '\$${userTransactions[index].amonut}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        userTransactions[index].title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(userTransactions[index].date)),
                      trailing: MediaQuery.of(context).size.width > 460
                          ? TextButton.icon(
                              icon: const Icon(Icons.delete),
                              label: const Text('Delete'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Theme.of(context).errorColor),
                              onPressed: () =>
                                  deleteTx(userTransactions[index].id),
                            )
                          : IconButton(
                              onPressed: () =>
                                  deleteTx(userTransactions[index].id),
                              icon: const Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                            ),
                    ),
                  ),
                );
              }),
    );
  }
}
