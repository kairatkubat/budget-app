import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/widgets/new_transaction.dart'; 
import './widgets/transaction_list.dart';
import './model/transaction.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flu',
      theme: ThemeData(
        fontFamily: 'QuickSand',
        primarySwatch: Colors.purple ,
        accentColor: Colors.amber
      ),
      home: Shop(),
    );
  }
}

class Shop extends StatefulWidget {
   
  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  final List<Transaction> _userTransactions = [
    //  Transaction(id: "tq", title: "Shoes", amount: 78.8, date: DateTime.now()),
    // Transaction(id: "t2", title: "Grocery ", amount: 7238, date: DateTime.now()),
  ]; 
  void _addTransaction(String txtitle, double txamount){
     final newTx = Transaction(
      id: DateTime.now().toString(),
       title: txtitle, 
       amount: txamount, 
       date: DateTime.now(),
       );
       setState(() {
   _userTransactions.add(newTx);
  });
  }
  // ignore: non_constant_identifier_names
void _startAddTransaction(BuildContext ctx){
  showModalBottomSheet<void>(context: ctx, builder:  (bCtx){ 
     return GestureDetector(
      onTap: (){},
      child: NewTransaction(_addTransaction),
      behavior: HitTestBehavior.opaque,
      );
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  
  actions: <Widget>[
IconButton(onPressed:() {
  _startAddTransaction(context); 
}, icon: Icon(Icons.add))
], title: const Text("Personal Expenses "),),
body:   Container(
  height: 600,
  child: ListView(
    children:[
      Container(
        width: double.infinity,
        height: 80,
        child: Card(
          margin: EdgeInsets.all(5),
          child: Text("Chart 1"),
          color: Theme.of(context).primaryColorLight,
          elevation: 5,
          
          
        ),
      ),
     TransactionList(_userTransactions),
      
    ],
  ),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
floatingActionButton: FloatingActionButton(

  child: Icon(Icons.add),
  onPressed: (() {
    _startAddTransaction(context);
  }
)
)
);
  
  }} 
