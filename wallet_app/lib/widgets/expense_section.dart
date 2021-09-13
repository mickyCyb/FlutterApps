import 'package:flutter/material.dart';
import 'package:wallet_app/data.dart';
import 'package:wallet_app/widgets/piechart.dart';

class ExpenseSection extends StatelessWidget {
  const ExpenseSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Expenses',
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: 
                    expenses.map((expense) => Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: pieColors[expenses.indexOf(expense)],
                            radius: 5,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            expense['name'],
                            style: TextStyle(
                              fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    )).toList(),
                  
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: PieChart(),
            ),
          ],
        ),
      ],
    );
  }
}