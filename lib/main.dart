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
bool _showChart = false;
  final List<Transaction> _userTransactions = [
    //  Transaction(id: "tq", title: "Shoes", amount: 78.8, date: DateTime.now()),
    // Transaction(id: "t2", title: "Grocery ", amount: 7238, date: DateTime.now()),
  ]; 

  List <Transaction> get _recentTransactions {
     return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));}).toList();
  }
  void _addTransaction(String txtitle, double txamount, DateTime choosenDate){
     final newTx = Transaction(
      id: DateTime.now().toString(),
       title: txtitle, 
       amount: txamount, 
       date: choosenDate,
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
void _deleteTransaction(String id){
setState(() {
  _userTransactions.removeWhere((element) => element.id == id );
});
}
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
  
  actions: <Widget>[
IconButton(onPressed:() {
  _startAddTransaction(context); 
}, icon: Icon(Icons.add))
], title: const Text("Personal Expenses "),);
    return Scaffold(
appBar: appBar,
body:   SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children:<Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Show chart"),
            Switch(
              activeColor: Theme.of(context).primaryColor,
              
              value: _showChart, onChanged: ( value) { 
              setState(() {
                  _showChart = value;
              });
            }, ),
          ],
        ),
     _showChart? Container(
      height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - 
      MediaQuery.of(context).padding.top) * 0.3,
      child: Chart(_recentTransactions)
      ):
     Container(
       height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - 
       MediaQuery.of(context).padding.top) * 0.7,
      child: TransactionList(_userTransactions, _deleteTransaction)),
      
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
