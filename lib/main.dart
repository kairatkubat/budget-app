import 'package:flutter/material.dart';
import 'package:shop/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flu',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: Shop(),
    );
  }
}

class Shop extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: "tq", title: "Shoes", amount: 78.8, date: DateTime.now()),
    Transaction(id: "t2", title: "Grocery ", amount: 7238, date: DateTime.now()),

  ].toList();
   Shop({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(actions: [], title: const Text("Shop "),),
body: Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround  ,
  crossAxisAlignment: CrossAxisAlignment.end,
  children:[
    Container(
      width: double.infinity,
      
      child: const Card(
        color: Colors.red,
        child: Text("firs "),
      ),
    ),
    Column(
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
                child: Text("\$ ${e.amount}", 
                style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold ),),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(e.title , style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text(e.date.toString(), style: TextStyle(color: Colors.grey),), 
                ],
              )
            ],
          ),
        );
      }).toList() ),
    
  ],
)
    );
  }} 
