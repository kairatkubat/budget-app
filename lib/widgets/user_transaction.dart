 import 'package:flutter/material.dart';
import 'package:shop/widgets/new_transaction.dart';
import 'package:shop/widgets/transaction_list.dart';

import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
   const UserTransaction({super.key});
 
   @override
   State<UserTransaction> createState() => _UserTransactionState();
 }
 
 class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
     Transaction(id: "tq", title: "Shoes", amount: 78.8, date: DateTime.now()),
    Transaction(id: "t2", title: "Grocery ", amount: 7238, date: DateTime.now()),
  ]; 
  void _addTransaction(String Txtitle, double Txamount){
     final newTx = Transaction(
      id: DateTime.now().toString(),
       title: Txtitle, 
       amount: Txamount, 
       date: DateTime.now(),
       );
       setState(() {
   _userTransactions.add(newTx);
  });
  }
  
   @override
   Widget build(BuildContext context) {
     return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
     );
   }
   
 }