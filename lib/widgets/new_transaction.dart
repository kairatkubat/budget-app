import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

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
            decoration: InputDecoration(
              labelText: "Title"
          ),
          // onChanged: (value) {
          //   amountInput = value;
          // },
          controller: amountController,
          ),
          TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.purple,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                   print(titleController.text);
                  },
                  child: const Text('Gradient'),
                ),
        ],
      ),
    ),
    );
  }
}