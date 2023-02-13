import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';



class TransactionList extends StatelessWidget { 

final List<Transaction> transactions;
TransactionList(this.transactions);
   
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
      children: transactions.map((e) {
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
                child: Text("\$  ${e.amount}", 
                style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold ),),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(e.title , style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text(DateFormat.yMMMd().format(e.date), style: TextStyle(color: Colors.grey),), 
                ],
              )
            ],
          ),
        );
      }).toList() ),
    );
  }
}