

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  
  final Function adTx;

  NewTransaction(this.adTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

void Ontap(){
  final enteredTitle = titleController.text;
  final enteredAmount = double.parse(amountController.text);
  if(enteredTitle.isEmpty || enteredAmount<=0){
    return;
  }
  widget.adTx(
     enteredTitle,
     enteredAmount);
     Navigator.of(context).pop();
}

  @override
  Widget build(BuildContext context) { 
    return 
    Card(child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:  [
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
            ),
            controller: titleController,
            onChanged: (value) {
              // TitleInput = value;
            },
          ),
           TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: "amount",
              
          ),
          // onChanged: (value) {
          //   amountInput = value;
          // },
          controller: amountController,
          onSubmitted: (_)=>Ontap(),
          ),
          TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.purple,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),
                  onPressed: Ontap,
                  child: const Text('add transaction', style: TextStyle(fontFamily: "QuickSand"),),
                ),
        ],
      ),
    ),
    );
  }
}