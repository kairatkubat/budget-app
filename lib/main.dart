import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/widgets/new_transaction.dart';
import 'package:shop/widgets/user_transaction.dart';
import './widgets/transaction_list.dart';

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
       
        primarySwatch: Colors.blue,
      ),
      home: Shop(),
    );
  }
}

class Shop extends StatelessWidget {
   
  // ignore: non_constant_identifier_names
  // late String TitleInput;
  // late String amountInput;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(actions: [], title: const Text("Shop "),),
body: Column(
  mainAxisAlignment: MainAxisAlignment.start  ,
  crossAxisAlignment: CrossAxisAlignment.end,
  children:[
    Container(
      width: double.infinity,
      height: 60,
      child: Card(
        child: Text("Chart 1"),
        color: Colors.red,
        elevation: 5,
        
        
      ),
    ),
   UserTransaction(),
    
  ],
)
    );
  }} 
