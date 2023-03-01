import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/model/transaction.dart';


class TransactionItemWidget extends StatefulWidget {
  const TransactionItemWidget({
    Key? key,
    required this.transaction  ,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItemWidget> createState() => _TransactionItemWidgetState();
}

class _TransactionItemWidgetState extends State<TransactionItemWidget> {
  late Color _bgColor;
@override
  void initState() {
    // TODO: implement initState
    const availableColor = [Colors.red, Colors.blue, Colors.black, Colors.purple];
    _bgColor = availableColor[Random().nextInt(4)];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      elevation: 5,
      child: ListTile(leading: CircleAvatar(
        backgroundColor: _bgColor,
        radius: 30, child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FittedBox(
          child: Text('\$${widget.transaction.amount}')),
      ),
      ),
      title: Text(widget.transaction.title, style:  Theme.of(context).textTheme.titleLarge,),
      subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
      trailing: MediaQuery.of(context).size.width >400 
      ? TextButton.icon(
        icon: Icon(Icons.delete),
        label: Text("delete"),
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).errorColor,
        ),
        onPressed: (() => widget.deleteTx(widget.transaction.id)),

      ):
      IconButton(
        color: Theme.of(context).errorColor,
        icon: Icon(Icons.delete ), onPressed:(() => widget.deleteTx(widget.transaction.id))  , ),
      ),
    );
  }
}