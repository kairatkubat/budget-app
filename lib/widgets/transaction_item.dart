import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/model/transaction.dart';


class TransactionItemWidget extends StatelessWidget {
  const TransactionItemWidget({
    Key? key,
    required this.transaction  ,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      elevation: 5,
      child: ListTile(leading: CircleAvatar(radius: 30, child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FittedBox(
          child: Text('\$${transaction.amount}')),
      ),
      ),
      title: Text(transaction.title, style:  Theme.of(context).textTheme.titleLarge,),
      subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
      trailing: MediaQuery.of(context).size.width >400 
      ? TextButton.icon(
        icon: Icon(Icons.delete),
        label: Text("delete"),
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).errorColor,
        ),
        onPressed: (() => deleteTx(transaction.id)),

      ):
      IconButton(
        color: Theme.of(context).errorColor,
        icon: Icon(Icons.delete ), onPressed:(() => deleteTx(transaction.id))  , ),
      ),
    );
  }
}