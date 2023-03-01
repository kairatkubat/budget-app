import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shop/widgets/adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  
  final Function adTx;

  NewTransaction(this.adTx){
    print("Costructor New transaction widget");
  }

  @override
  State<NewTransaction> createState() {
    print(" Create State NewTransaction Widget ");
    return _NewTransactionState();
    }
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
 DateTime ?_selectedDate;
 _NewTransactionState(){
  print("Constractor new transaction State");
 }

 @override
  void initState() {
    super.initState();
    print("Init state ");
    
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
     print("Did update widget ");
     super.didUpdateWidget(oldWidget);
     
  }

  @override
  void dispose() {
    print("Dispose widget");
    super.dispose();
  }

void _Ontap(){
  if(_amountController.text.isEmpty){
    return;
  }
  final enteredTitle = _titleController.text;
  final enteredAmount = double.parse(_amountController.text);
  if(enteredTitle.isEmpty || enteredAmount<=0 || _selectedDate == null){
    
    return;
  }
  widget.adTx(
     enteredTitle,
     enteredAmount,
     _selectedDate 
     );
     Navigator.of(context).pop();
}
void _presentDatePicker(){
  showDatePicker(context: context, 
  initialDate: DateTime.now(),
   firstDate: DateTime(2023), lastDate: DateTime.now()).then((_pickedDate) {
    if(_pickedDate == null){
      return; 
    }
  setState(() {
    _selectedDate = _pickedDate!;
  });
   });
}
  @override
  Widget build(BuildContext context) { 
    return 
    SingleChildScrollView(
      child: Card(child: Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10,
         bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            CupertinoTextField(

            ),
            TextField( 
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: _titleController,
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
            controller: _amountController,
            onSubmitted: (_)=>_Ontap(),
            ),
            Container(
              height: 70,
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(_selectedDate == null? 
                  "No date Chosen":
                   'Picked Date : ${DateFormat.yMd().format(_selectedDate!)}'),
                ),
               AdaptiveButton(_presentDatePicker, "choose date")
              ],),
            ),
             ElevatedButton(
                    onPressed: _Ontap,
                    child: const Text('add transaction',
                    ),
                  ),
          ],
        ),
      ),
      ),
    );
  }
}