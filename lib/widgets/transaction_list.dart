import 'package:flutter/material.dart';
import 'package:shop/widgets/transaction_item.dart';
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
            
          ],):
    //     ) : ListView.builder(
    //   itemBuilder: (context, index){
    //     return TransactionItemWidget(transaction: transactions[index], deleteTx: deleteTx);  
    
    //   },
    //   itemCount: transactions.length ,
    // );
ListView(
  children: [
    ...transactions.map((e) => TransactionItemWidget(
      key: ValueKey(e.id),
      transaction: e, deleteTx: deleteTx)).toList(),
  ],
);
  }
}

 //return TransactionItemWidget(transaction: transactions[index], deleteTx: deleteTx); 
