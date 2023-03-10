import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/widgets/chart_bar.dart';
import '../model/transaction.dart';
class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart(this.recentTransactions);
  List <Map<String,  Object>> get groupTransactionValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0; 
      for(var i = 0; i < recentTransactions.length; i++){
        if(recentTransactions[i].date.day == weekDay.day&&
        recentTransactions[i].date.month == weekDay.month &&
        recentTransactions[i].date.year == weekDay.year){
           totalSum = totalSum + recentTransactions[i].amount; 
        }
      } 

      return {
        'day':DateFormat.E().format(weekDay).substring(0,1) , 
        'amount': totalSum }; 
    } 
    );
  }
  double get totalSpending{
    groupTransactionValues.fold(0.0, (sum, item) {
      // print(item['amount'] as double);
      // print("hello");
      // print(sum);
      return  sum + (item['amount'] as double) ;
    });
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Card(  
      elevation: 6, margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround ,
          children: groupTransactionValues.map((e) {
            print((e['amount'] as double) /totalSpending.toDouble());
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                e['day'].toString(), 
              e['amount'] as double, 
              totalSpending == 0.0? 0.0 : 
               (e['amount'] as double) / totalSpending),
            );
          }).toList(),
          
        ),
      ),
    );
   
    
  }
}