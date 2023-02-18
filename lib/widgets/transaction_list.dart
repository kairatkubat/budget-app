import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';



class TransactionList extends StatelessWidget { 

final List<Transaction> transactions;
TransactionList(this.transactions);
   
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty ? Column(
            children: <Widget>[
              Text("Not transactions added yet", style: Theme.of(context).textTheme.titleMedium ,
              ),
              
            ],
          ) : ListView.builder(
        itemBuilder: (context, index){
           return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),),
                padding: EdgeInsets.all(10 ),
                child: Text("\$  ${transactions[index ].amount}", 
                style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold ),),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(transactions[index] .title , style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text(DateFormat.yMMMd().format(transactions[index].date), style: TextStyle(color: Colors.grey),), 
                ],
              )
            ],
          ),
        ); 
        },
        itemCount: transactions.length ,
      ),
    );
  }
}