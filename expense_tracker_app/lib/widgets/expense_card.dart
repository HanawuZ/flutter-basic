import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatefulWidget {
  final String title;
  final double amount;
  final Category category;
  final DateTime date;
  const ExpenseCard({
    super.key,
    required this.title,
    required this.amount,
    required this.category,
    required this.date
  });

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  final Map<Category, Icon> categoryIcons = {
    Category.food: Icon(Icons.fastfood),
    Category.travel: Icon(Icons.airplanemode_active),
    Category.leisure: Icon(Icons.sports_soccer),
    Category.work: Icon(Icons.work),
  };

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink[100],
      margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Row(
              children: [
                Icon(Icons.attach_money),
                Text("${widget.amount.toString()}", style: TextStyle(fontSize: 16),),
                Spacer(),
                _buildCategoryIcon(widget.category),
                // Icon(Icons.food_bank)
              ],
            ),
            Row(
              children: [
                Icon(Icons.access_alarm),
                SizedBox(width: 10,),
                Text(DateFormat.yMMMEd().format(widget.date))
              ],
            ),
          ],
        ),
      )
    );
  }

  Widget _buildCategoryIcon(Category category) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 8),
        categoryIcons[category] ?? Icon(Icons.error), // Display category icon
      ],
    );
  }
}