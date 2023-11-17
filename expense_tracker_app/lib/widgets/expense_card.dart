import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatefulWidget {
  final String title;
  final double amount;
  final Category category;
  const ExpenseCard({
    super.key,
    required this.title,
    required this.amount,
    required this.category
  });

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.pink[100],
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Row(
            children: [
              Text("\$ ${widget.amount.toString()}"),
              Spacer(),
              Icon(Icons.food_bank)
            ],
          )
        ],
      )
    );
  }
}