import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbols.dart';
import 'package:shop/widgets/chart.dart';
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
        accentColor: Colors.amber,
        
        secondaryHeaderColor: Colors.amber,
        // textTheme: ThemeData.light().textTheme.copyWith(
        //   titleSmall: TextStyle(
        //     fontFamily: 'OpenSans',
        //     fontWeight: FontWeight.bold,
        //     fontSize: 18
        //   ),
        //   button:  TextStyle(color: Colors.white)
        // )
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                
                 // background color
                textStyle: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'QuickSand'
                    ))),
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

  List <Transaction> get _recentTransactions {
     return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));}).toList();
  }
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
     Chart(_recentTransactions),
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
