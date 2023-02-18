
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  
  final Function adTx;

  NewTransaction(this.adTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
 DateTime ?_selectedDate;

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
    Card(child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:  [
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
              TextButton(
                style: TextButton.styleFrom(
                  // foregroundColor: Theme.of(context).primaryColor
                ),
                onPressed: _presentDatePicker, 
                child: Text("Choose date", style: TextStyle(
                  fontSize: 15 ,
                  fontWeight: FontWeight.bold),))
            ],),
          ),

          ElevatedButton(
                  onPressed: _Ontap,
                  child: const  Text('add transaction',
                  ),
                ),
        ],
      ),
    ),
    );
  }
}