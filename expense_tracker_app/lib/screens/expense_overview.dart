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
        category: Category.work,
      ),
      Expense(
        title: 'Sea Vacation',
        amount: 17.69,
        date: DateTime.now(),
        category: Category.travel,
      ),
      Expense(
        title: 'Shabu',
        amount: 12.49,
        date: DateTime.now(),
        category: Category.travel,
      ),
      Expense(
        title: 'KFC',
        amount: 4,
        date: DateTime.now(),
        category: Category.food,
      ),
      Expense(
        title: 'Shopping',
        amount: 200,
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
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Chart...."),
            Container(
              height: MediaQuery.of(context).size.height - 225, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _registeredExpenses.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_registeredExpenses[index].hashCode.toString()),
                    onDismissed: (direction) {
                      // Implement your logic when the card is dismissed
                      // For example, remove the item from the list
                      setState(() {
                        _registeredExpenses.removeAt(index);
                      });
                    },
                    background: Container(
                      color: null, // Background color when swiping
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                    child: ExpenseCard(
                      title: _registeredExpenses[index].title,
                      amount: _registeredExpenses[index].amount,
                      category: _registeredExpenses[index].category,
                      date: _registeredExpenses[index].date,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
}