import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expense_card.dart';
import 'package:expense_tracker_app/models/expense.dart';

class ExpenseOverview extends StatefulWidget {

  const ExpenseOverview({super.key});

  @override
  State<ExpenseOverview> createState() => _ExpenseOverviewState();
}

class _ExpenseOverviewState extends State<ExpenseOverview> {
    final List<Expense> _registeredExpenses = [
      Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work,
      ),
      Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure,
      ),
      Expense(
        title: 'Sea Vacation',
        amount: 17.69,
        date: DateTime.now(),
        category: Category.leisure,
      ),
      Expense(
        title: 'Read Book',
        amount: 7.69,
        date: DateTime.now(),
        category: Category.leisure,
      ),
      Expense(
        title: 'Sea Vacation',
        amount: 17.69,
        date: DateTime.now(),
        category: Category.leisure,
      ),
      Expense(
        title: 'Sea Vacation',
        amount: 17.69,
        date: DateTime.now(),
        category: Category.leisure,
      ),
    ];

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Chart...."),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
              itemCount: _registeredExpenses.length,
              itemBuilder: (context, index) {
                return ExpenseCard(
                    title: _registeredExpenses[index].title,
                    amount: _registeredExpenses[index].amount,
                    category: _registeredExpenses[index].category
                );
              },
          )
        ],
      ),
    );
  }
}