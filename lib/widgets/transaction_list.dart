import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';



class TransactionList extends StatelessWidget { 
Function deleteTx; 
final List<Transaction> transactions;
TransactionList(this.transactions, this.deleteTx);
   
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ?  Column(
          children: <Widget>[
            Text("Not transactions added yet", style: Theme.of(context).textTheme.titleMedium ,
            ),
            Container(
              height: 200,
              child: Image.asset('lib/assets/images/23.png'))
            
          ],
        ) : ListView.builder(
      itemBuilder: (context, index){
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          elevation: 5,
          child: ListTile(leading: CircleAvatar(radius: 30, child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
              child: Text('\$${transactions[index].amount}')),
          ),
          ),
          title: Text(transactions[index].title, style:  Theme.of(context).textTheme.titleLarge,),
          subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
          trailing:  IconButton(
            color: Theme.of(context).errorColor,
            icon: Icon(Icons.delete ), onPressed:(() => deleteTx(transactions[index].id))  , ),
          ),
        );  
    
      },
      itemCount: transactions.length ,
    );
  }
}